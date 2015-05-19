require 'open3'
require "kaspersky/linux_fs/version"
require "kaspersky/linux_fs/response/fast_scan"

module Kaspersky
  class LinuxFs
    SKIP_ACTION = 'Skip'

    def initialize(bin, use_sudo = false)
      @bin = bin
      @use_sudo = use_sudo
      @default_options = {
        action: SKIP_ACTION
      }
    end

    def fast_scan(path_to_file, options = {})
      command = "#{build_base_request}#{build_options(options.to_hash.merge({ scan_file: path_to_file.to_s }))}"
      output = nil
      success = false

      Open3.popen3(command) do |stdin, stdout, stderr, thread|
        process = thread.value
        output = stderr.read

        # "sudo -n ..." exit with code 0 when password is incorrect
        # so, checking stderr is required
        if process.success? && output.size.zero?
          output = stdout.read
          success = true
        end
      end

      fail "#{output}" unless success

      Kaspersky::LinuxFs::Response::FastScan.new(output)
    end

    private

    def build_base_request
      request = @bin.dup

      # n - non-interactive
      request.prepend('sudo -n ') if @use_sudo

      request
    end

    def build_options(data)
      data = @default_options.merge(data)
      options = ''
      data.each do |key, value|
        options += " --#{key.to_s.tr('_', '-')} #{value}"
      end
      options
    end
  end
end

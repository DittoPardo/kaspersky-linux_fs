module Kaspersky
  module LinuxFs
    module Response
      class FastScan
        def initialize(string_response)
          @raw_data = string_response
          @data = {}
          prepare_data
        end

        def threat?
          @data.key?(:threats_found) && !@data[:threats_found].zero?
        end

        def safe?
          !threat?
        end

        private

        def prepare_data
          @raw_data.split("\n").each do |string|
            title, count = string.split(":").each(&:strip!)
            @data[title.downcase.tr(" ", "_").to_sym] = count.to_i
          end
        end
      end
    end
  end
end
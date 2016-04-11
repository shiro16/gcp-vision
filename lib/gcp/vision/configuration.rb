module Gcp
  module Vision
    module Configuration
      def config
        @config ||= Config.new
      end

      def configure
        yield config
      end

      class Config
        attr_accessor :api_host, :api_version, :api_path, :api_key

        def initialize
          @api_host    = 'vision.googleapis.com'
          @api_version = 'v1'
          @api_path    = '/images:annotate'
          @api_key     = ENV['GCP_VISION_API_KEY' ]
        end

        def endpoint_uri
          "https://#{api_host}/#{api_version}#{api_path}?key=#{api_key}"
        end
      end
    end
  end
end

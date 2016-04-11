require "gcp/vision/version"
require "gcp/vision/client"

module Gcp
  module Vision
    class << self
      def configure(&block)
        client.configure(&block)
      end

      def annotate_image(image)
        client.annotate_image(image)
      end

      private
      def client
        @client ||= Gcp::Vision::Client.new
      end
    end
  end
end

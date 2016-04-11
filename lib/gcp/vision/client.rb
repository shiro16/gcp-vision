require 'httpclient'
require 'gcp/vision/configuration'
require 'gcp/vision/response'

module Gcp
  module Vision
    class Client
      include Configuration

      def annotate_image(requests)
        client = ::HTTPClient.new
        response = client.post(config.endpoint_uri, requests.to_json, 'Content-Type' => 'application/json')
        Gcp::Vision::Response.new(response)
      end
    end
  end
end

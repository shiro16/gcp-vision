require 'json'
require 'gcp/vision/error'
require 'gcp/vision/annotation'

module Gcp
  module Vision
    class Response
      attr_reader :response, :responses

      def initialize(response)
        @response = response

        check_status
        @responses = process_response
      end

      private
      def check_status
        message = case @response.status
                  when 200...300
                  when 301, 302, 303, 307
                    sprintf('Redirect to %s', @response.header[:location])
                  when 401
                    'Unauthorized'
                  when 304, 400, 402...500
                    'Invalid request'
                  when 500...600
                    'Server error'
                  else
                    'Unknown error'
                  end
        if message
          raise Gcp::Vision::Error.new(message, status_code: @response.status, header: @response.header, body: @response.body)
        end
      end

      def process_response
        responses = JSON.parse(@response.body)["responses"]
        responses.map { |res| Gcp::Vision::Annotation.new(res) }
      end
    end
  end
end

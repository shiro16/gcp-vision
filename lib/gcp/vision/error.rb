module Gcp
  module Vision
    class Error < StandardError
      attr_reader :options

      def initialize(message, options)
        @options = options
        super(message)
      end
    end
  end
end

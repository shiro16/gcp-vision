require 'spec_helper'

describe Gcp::Vision::Error do
  describe '.new' do
    let(:message) { "google cloud platform vision API" }
    let(:options) { { status: 300 } }
    let(:error) { Gcp::Vision::Error.new(message, options) }

    it do
      expect(error.message).to eq(message)
    end

    it do
      expect(error.options).to eq(options)
    end
  end
end

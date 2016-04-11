require 'spec_helper'

describe Gcp::Vision do
  describe '.configure' do
    let(:block) { Proc.new {} }

    it 'call Client#configure' do
      expect_any_instance_of(Gcp::Vision::Client).to receive(:configure)
      Gcp::Vision.configure(&block)
    end
  end

  describe '.annotate_image' do
    let(:image) { "test" }

    it 'call Client#annotate_image' do
      expect_any_instance_of(Gcp::Vision::Client).to receive(:annotate_image).with(image)
      Gcp::Vision.annotate_image(image)
    end
  end

  it 'has a version number' do
    expect(Gcp::Vision::VERSION).not_to be nil
  end
end

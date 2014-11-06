require 'spec_helper'

describe AverageHash::Image do
  context 'with argument "sample.jpg"' do
    subject { AverageHash::Image.new(fixture_file_path('sample.jpg')) }
    it { is_expected.to be_test }
  end
end

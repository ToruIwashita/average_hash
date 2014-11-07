require 'spec_helper'

describe AverageHash::Image do
  context 'sample_1 test' do
    it '"sample_1.jpg" fingerprint' do
      image_1 = AverageHash::Image.new(fixture_file_path('sample_1.jpg'))
      expect(image_1.fingerprint).to eq 13158600607563222924
    end
  end

  context 'sample_2 test' do
    it '"sample_2.jpg" fingerprint' do
      image_2 = AverageHash::Image.new(fixture_file_path('sample_2.jpg'))
      expect(image_2.fingerprint).to eq 7870530257777914161
    end
  end

  context 'two images test' do
    before do
      @image_1 = AverageHash::Image.new(fixture_file_path('sample_1.jpg'))
      @image_2 = AverageHash::Image.new(fixture_file_path('sample_2.jpg'))
    end

    it '"sample_1" distance_from from "sample_2"' do
      expect(@image_1.distance_from(@image_2)).to eq 36
    end

    it '"sample_1" duplicate? "sample_2"' do
      expect(@image_1.duplicate?(@image_2)).to eq false
    end

    it '"sample_1" duplicate? "sample_2" with threshold 35' do
      expect(@image_1.duplicate?(@image_2, threshold: 35)).to eq false
    end

    it '"sample_1" duplicate? "sample_2" with threshold 36' do
      expect(@image_1.duplicate?(@image_2, threshold: 36)).to eq true
    end
  end

  context 'duplicate image test' do
    it '"sample_1" duplicate? "sample_1"' do
      image_1_1 = AverageHash::Image.new(fixture_file_path('sample_1.jpg'))
      image_1_2 = AverageHash::Image.new(fixture_file_path('sample_1.jpg'))
      expect(image_1_1.duplicate?(image_1_2)).to eq true
    end
  end
end

describe AverageHash::HashingStrategy do
  it 'generate_hash with argument "sample_1.jpg" ' do
    hashing_strategy = AverageHash::HashingStrategy.new(fixture_file_path('sample_1.jpg'))
    expect(hashing_strategy.generate_hash).to eq "1011011010011100101111011000100100001011000010111000111110001100"
  end
end

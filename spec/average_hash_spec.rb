require 'spec_helper'

describe AverageHash::Image do
  let(:image_1) { AverageHash::Image.new(fixture_file_path('sample_1.jpg')) }
  let(:image_2) { AverageHash::Image.new(fixture_file_path('sample_2.jpg')) }

  context 'fingerprint use sample_1.jpg' do
    it { expect(image_1.fingerprint).to eq 13158600607563222924 }
  end

  context 'fingerprint use sample_2.jpg' do
    it { expect(image_2.fingerprint).to eq 7870530257777914161 }
  end

  context 'use two jpg images' do
    before do
      image_1
      image_2
    end

    context '"sample_1" distance_from "sample_2"' do
      it { expect(image_1.distance_from(image_2)).to eq 36 }
    end

    context '"sample_1" duplicate? "sample_2"' do
      it { expect(image_1.duplicate?(image_2)).to be_falsey }
    end

    context '"sample_1" duplicate? "sample_2" with threshold 35' do
      it { expect(image_1.duplicate?(image_2, threshold: 35)).to be_falsey }
    end

    context '"sample_1" duplicate? "sample_2" with threshold 36' do
      it { expect(image_1.duplicate?(image_2, threshold: 36)).to be_truthy }
    end
  end

  context 'use duplicate jpg image, "sample_1" duplicate? "sample_1"' do
    let(:image_2) { AverageHash::Image.new(fixture_file_path('sample_1.jpg')) }

    it { expect(image_1.duplicate?(image_2)).to be_truthy }
  end
end

describe AverageHash::HashingStrategy do
  let(:hashing_strategy) { AverageHash::HashingStrategy.new(fixture_file_path('sample_1.jpg')) }

  context 'generate_hash with argument "smaple_1.jpg"' do
    it { expect(hashing_strategy.generate_hash).to eq '1011011010011100101111011000100100001011000010111000111110001100' }
  end
end

require 'spec_helper'

describe AverageHash::Image do
  it '"sample_1.jpg" fingerprint' do
    image = AverageHash::Image.new(fixture_file_path('sample_1.jpg'))
    expect(image.fingerprint).to eq 13158600607563222924
  end

  it '"sample_2.jpg" fingerprint' do
    image = AverageHash::Image.new(fixture_file_path('sample_2.jpg'))
    expect(image.fingerprint).to eq 7870530257777914161
  end

  it '"sample_1" distance_from from "sample_2"' do
    image_1 =  AverageHash::Image.new(fixture_file_path('sample_1.jpg'))
    image_2 =  AverageHash::Image.new(fixture_file_path('sample_2.jpg'))
    expect(image_1.distance_from(image_2)).to eq 36
  end

  it '"sample_1" duplicate? "sample_2"' do
    image_1 = AverageHash::Image.new(fixture_file_path('sample_1.jpg'))
    image_2 = AverageHash::Image.new(fixture_file_path('sample_2.jpg'))
    expect(image_1.duplicate?(image_2)).to eq false
  end

  it '"sample_1" duplicate? "sample_2" with threshold 35' do
    image_1 = AverageHash::Image.new(fixture_file_path('sample_1.jpg'))
    image_2 = AverageHash::Image.new(fixture_file_path('sample_2.jpg'))
    expect(image_1.duplicate?(image_2, threshold: 35)).to eq false
  end

  it '"sample_1" duplicate? "sample_2" with threshold 36' do
    image_1 = AverageHash::Image.new(fixture_file_path('sample_1.jpg'))
    image_2 = AverageHash::Image.new(fixture_file_path('sample_2.jpg'))
    expect(image_1.duplicate?(image_2, threshold: 36)).to eq true
  end

  it '"sample_1" duplicate? "sample_1"' do
    image_1 = AverageHash::Image.new(fixture_file_path('sample_1.jpg'))
    image_2 = AverageHash::Image.new(fixture_file_path('sample_1.jpg'))
    expect(image_1.duplicate?(image_2)).to eq true
  end
end

describe AverageHash::HashingStrategy do
  it 'generate_hash with argument "sample_1.jpg" ' do
    hashing_strategy = AverageHash::HashingStrategy.new(fixture_file_path('sample_1.jpg'))
    expect(hashing_strategy.generate_hash).to eq "1011011010011100101111011000100100001011000010111000111110001100"
  end
end

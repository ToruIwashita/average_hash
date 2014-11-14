# coding: utf-8

require 'RMagick'

module AverageHash
  class HashingStrategy
    RESIZNING_SIZE = 8
    PIXEL_ACQUISITION_SIZE = 1

    INDEX_OF_R = 0
    INDEX_OF_G = 1
    INDEX_OF_B = 2

    NTSC_COEFFICIENT_OF_R = 0.30
    NTSC_COEFFICIENT_OF_G = 0.59
    NTSC_COEFFICIENT_OF_B = 0.11

    def initialize(file_path)
      @image = Magick::Image.read(file_path).first.resize(RESIZNING_SIZE, RESIZNING_SIZE)
    end

    def generate_hash
      (image_pixel_count.times).map { |i| gray_scaled_pixel(i) > average_pixel ? '1' : '0' }.join
    end

    private

    def image_columns
      @image.columns
    end

    def image_rows
      @image.rows
    end

    def image_pixel_count
      image_columns * image_rows
    end

    def average_pixel
      gray_scaled_pixels = (image_pixel_count.times).map { |i| gray_scaled_pixel(i) }
      gray_scaled_pixels.reduce(0, :+) / image_pixel_count
    end

    def gray_scaled_pixel(index)
      px = pixel_at((index % RESIZNING_SIZE), (index / RESIZNING_SIZE))
      px[INDEX_OF_R] * NTSC_COEFFICIENT_OF_R + px[INDEX_OF_G] * NTSC_COEFFICIENT_OF_G + px[INDEX_OF_B] * NTSC_COEFFICIENT_OF_B
    end

    def pixel_at(offset_of_x, offset_of_y)
      @image.export_pixels(offset_of_x, offset_of_y, PIXEL_ACQUISITION_SIZE, PIXEL_ACQUISITION_SIZE)
    end
  end
end

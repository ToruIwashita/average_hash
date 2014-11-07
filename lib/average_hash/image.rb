# coding: utf-8

module AverageHash
  class Image
    DEFAULT_DUPE_THRESHOLD = 5

    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def fingerprint
      @average_hash ||= HashingStrategy.new(@file_path).generate_hash
      @average_hash.to_i(2)
    end

    def distance_from(other)
      (fingerprint ^ other.fingerprint).to_s(2).count('1')
    end

    def duplicate?(other, opts = {})
      threshold = opts[:threshold] || DEFAULT_DUPE_THRESHOLD
      distance_from(other) <= threshold
    end
  end
end

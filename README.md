[![Build Status](https://travis-ci.org/ToruIwashita/average_hash.svg?branch=master)](https://travis-ci.org/ToruIwashita/average_hash)
[![Code Climate](https://codeclimate.com/github/ToruIwashita/average_hash/badges/gpa.svg)](https://codeclimate.com/github/ToruIwashita/average_hash
[![Coverage Status](https://coveralls.io/repos/ToruIwashita/average_hash/badge.svg)](https://coveralls.io/r/ToruIwashita/average_hash)

# AverageHash

Simple similarity calculation method of image. It is inspired by [Phashion](https://github.com/westonplatter/phashion).

## Installation

Add this line to your application's Gemfile:

    gem 'average_hash'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install average_hash

## Usage

Determine the similarity of image

    require 'average_hash'
    image_1 = AverageHash::Image.new(file_path_1)
    image_2 = AverageHash::Image.new(file_path_2)
    image_1.duplicate?(image_2)
    => true

If you want to set the threshold of hamming distance, you can do the following. (dafault threshold is 5)

    image_1.duplicate?(image_2, threshold: 3)
    => false

Get the hamming distance between two images

    image_1.distance_from(image_2)
    => 4

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

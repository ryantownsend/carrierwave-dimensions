# CarrierwaveDimensions

Stores the dimensions of an image when uploading. Individual versions can be stored with different columns in the database.

## Installation

Add this line to your application's Gemfile:

    gem 'carrierwave-dimensions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave-dimensions

## Usage

    class MyUploader < CarrierWave::Uploader::Base
    
      version :thumbnail do
        process resize_to_fill: [500, 500]
        process :store_dimensions
        process :store_dimensions, columns: "thumbnail"
        process :store_dimensions, {
          width_column: "thumbnail_width",
          height_column: "thumbnail_height"
        }
      end
    
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

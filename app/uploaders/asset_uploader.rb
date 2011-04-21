# encoding: utf-8
#require 'C:\Ruby192\lib\ruby\gems\1.9.1\gems\rmagick-2.12.0-x86-mswin32\lib\RMagick'
require 'carrierwave/processing/mini_magick'

class AssetUploader < CarrierWave::Uploader::Base
  # Include RMagick or ImageScience support:
  #include CarrierWave::RMagick
  # include CarrierWave::ImageScience
  include CarrierWave::MiniMagick
  
  attr_accessor :height, :width

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :s3

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumbnail do
    process :resize_to_fill => [80, 80, gravity = 'Center']
    #process :colorspace => 'rgb' #need Magick for this to run
    process :convert => 'jpg'
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  def filename
      @filename     
  end
  
  def colorspace(cs)
    manipulate! do |img|
      case cs
      when 'rgb'
        img.colorspace = Magick::RGBColorspace
      when 'cmyk'
        img.colorspace = Magick::CMYKColorspace
      end
      img = yield(img) if block_given?
      img
    end
  end

  
  
  def cache_dir
    "#{RAILS_ROOT}/tmp/uploads"
  end
  
  before :store, :save_dimensions
  def save_dimensions(foo = nil)
    manipulate! do |img|
      self.height = img['height']
      self.width = img['width']
      img
    end
  end
  
  

end

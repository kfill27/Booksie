# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer
# Create different versions of your uploaded files:

  # version :thumb do
  #   process :thumbnail => [200, 200]
  # end
  process encode_video: [:mp4, callbacks: { after_transcode: :set_success } ]

  # version :mp4 do
  #   process :encode_video => [:mp4]
  #   def full_filename(for_file)
  #     "#{File.basename(for_file, File.extname(for_file))}.mp4"
  #   end
  # end

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end



  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(ogg ogv 3gp mp4 m4v webm mov m2v 3g2)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  version :thumb do
  process thumbnail: [{format: 'png', quality: 10, size: 200, logger: Rails.logger}]
  end

  #   def full_filename for_file
  #     png_name for_file, version_name
  #   end
  # end

  # def png_name for_file, version_name
  #   %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
  # end

end

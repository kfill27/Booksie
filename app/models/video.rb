class Video < ActiveRecord::Base
  belongs_to :booksie_page
  mount_uploader :file, VideoUploader

  def set_success(format, opts)
    self.success = true
  end
end

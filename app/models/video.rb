class Video < ActiveRecord::Base
  belongs_to :booksie_page
  mount_uploader :video, VideoUploader

  def set_success(format, opts)
    puts "Hooray!"
    #self.success = true
  end
end

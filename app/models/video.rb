class Video < ActiveRecord::Base
  belongs_to :booksie_page
  has_many :comments, :as => :commentable
  mount_uploader :video, VideoUploader
  acts_as_taggable

  def set_success(format, opts)
    #self.success = true
  end
end

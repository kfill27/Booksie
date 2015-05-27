class Milestone < ActiveRecord::Base
	belongs_to :booksie_page
  has_many :comments, :as => :commentable
end

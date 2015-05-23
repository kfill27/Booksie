class Ability < ActiveRecord::Base
	belongs_to :user
	belongs_to :booksie_page
end

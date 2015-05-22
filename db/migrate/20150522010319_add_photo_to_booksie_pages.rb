class AddPhotoToBooksiePages < ActiveRecord::Migration
  def change
    add_reference :booksie_pages, :booksie_page, index: true, foreign_key: true
  end
end

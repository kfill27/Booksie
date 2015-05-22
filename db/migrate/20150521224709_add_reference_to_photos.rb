class AddReferenceToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :booksie_page, index: true, foreign_key: true
  end
end

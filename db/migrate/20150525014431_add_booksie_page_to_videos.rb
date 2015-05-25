class AddBooksiePageToVideos < ActiveRecord::Migration
  def change
    add_reference :videos, :booksie_page, index: true, foreign_key: true
  end
end

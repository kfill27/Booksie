class CreateBooksiePages < ActiveRecord::Migration
  def change
    create_table :booksie_pages do |t|

      t.timestamps null: false
    end
  end
end

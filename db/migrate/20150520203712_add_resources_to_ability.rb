class AddResourcesToAbility < ActiveRecord::Migration
  def change
    add_reference :abilities, :user, index: true, foreign_key: true
    add_reference :abilities, :booksie_page, index: true, foreign_key: true
  end
end

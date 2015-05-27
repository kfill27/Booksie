class AddBooksiePagesToMilestones < ActiveRecord::Migration
  def change
    add_reference :milestones, :booksie_page, index: true, foreign_key: true
  end
end

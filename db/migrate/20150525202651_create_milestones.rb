class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.text :post
      t.date :date

      t.timestamps null: false
    end
  end
end

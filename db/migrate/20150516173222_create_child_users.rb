class CreateChildUsers < ActiveRecord::Migration
  def change
    create_table :child_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :child, index: true, foreign_key: true
      t.string :relationship

      t.timestamps null: false
    end
  end
end

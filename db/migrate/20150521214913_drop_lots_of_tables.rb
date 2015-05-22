class DropLotsOfTables < ActiveRecord::Migration
  def change
    drop_table :child_users
    drop_table :group_users
    drop_table :groups
    drop_table :children
  end
end

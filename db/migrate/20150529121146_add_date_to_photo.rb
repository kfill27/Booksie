class AddDateToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :date, :date
  end
end

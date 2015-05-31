class AddCaptionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :caption, :text
  end
end

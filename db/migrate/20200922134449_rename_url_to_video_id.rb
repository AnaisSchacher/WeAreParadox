class RenameUrlToVideoId < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :url, :video_id
  end
end

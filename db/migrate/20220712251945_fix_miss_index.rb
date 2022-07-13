class FixMissIndex < ActiveRecord::Migration[6.1]
  def change
    add_column :picture_tags, :picture_id, :integer
    add_column :picture_tags, :tag_id, :integer
    remove_index :picture_tags, [:picture_id, :tag_id]
    add_index :picture_tags, [:picture_id, :tag_id], unique: true
  end
end

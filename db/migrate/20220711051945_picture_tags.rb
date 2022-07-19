class PictureTags < ActiveRecord::Migration[6.1]
  def change
    create_table :picture_tags do |t|
    t.timestamps null: false
    t.integer :picture_id, null: false
    t.integer :tag_id, null: false
  end
  add_index :picture_tags, [:picture_id, :tag_id], unique: true
  end
end

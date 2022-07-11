class PictureTags < ActiveRecord::Migration[6.1]
  def change
    create_table :picture_tags do |t|
    t.timestamps null: false
  end
  end
end

class Tags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
    t.integer "picture_tag_id"
    t.string "name"
    t.integer "cloud", default: 0
    t.timestamps null: false
    end
  end
end
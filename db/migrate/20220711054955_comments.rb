class Comments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
    t.text "message", null: false
    t.integer "picture_id", null: false
    t.integer "customer_id", null: false
    t.timestamps null: false
  end
  end
end

class Likes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer "customer_id", null: false
      t.integer "picture_id", null: false
      t.timestamps null: false
    end
  end
end

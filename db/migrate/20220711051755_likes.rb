class Likes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
    t.timestamps null: false
  end
  end
end

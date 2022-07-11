class Bookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
    t.timestamps null: false
  end
  end
end

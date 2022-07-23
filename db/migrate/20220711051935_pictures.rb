class Pictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
    t.text "explain", null: false
    t.integer "customer_id", null: false
    t.timestamps null: false
  end
  end
end

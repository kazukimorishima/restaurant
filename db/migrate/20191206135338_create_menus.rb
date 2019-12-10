class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :detail
      t.integer :price
      t.integer :category_id

      t.timestamps
    end
  end
end

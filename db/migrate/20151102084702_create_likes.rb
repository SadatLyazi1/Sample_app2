class CreateLikes < ActiveRecord::Migration
  def up
    create_table :likes do |t|
      t.integer :chef_id
      t.integer :recipe_id
      t.boolean :like

      t.timestamps null: false
    end
  end

  def down 

  	drop table :likes
  end
end

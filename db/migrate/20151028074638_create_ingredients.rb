class CreateIngredients < ActiveRecord::Migration
  def up
    create_table :ingredients do |t|

      t.string :name
      t.timestamps null: false
    end
 end
   def down
       drop_table :chefs   
    end
end

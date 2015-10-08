class CreateChefs < ActiveRecord::Migration
  def up
    create_table :chefs do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps null: false
    end
end
   def down
   	  drop_table :chefs
   
  end
end

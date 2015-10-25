class AddAColumnToRecipes < ActiveRecord::Migration
  def up
  	add_column :recipes, :picture, :string ,after: :name
  end

  def down
  	remove_column :recipes, :picture
  end
end

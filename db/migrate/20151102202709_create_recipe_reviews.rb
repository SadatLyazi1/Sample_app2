class CreateRecipeReviews < ActiveRecord::Migration
  def up
    create_table :recipe_reviews do |t|
    	
      t.integer :review_id
      t.integer :recipe_id
      t.timestamps null: false
    end
  end
  def down
  drop_table :recipe_reviews
   end
end

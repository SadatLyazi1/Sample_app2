class CreateReviews < ActiveRecord::Migration
  def up
    create_table :reviews do |t|
      t.string :name
      t.text :body
      t.interger :recipe_id
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  def down
  	drop_table :reviews
  end
end

class ChangeAColumnToPasswordDigestToChefsTable < ActiveRecord::Migration
  def up
  	remove_column :chefs, :password 
  	add_column :chefs, :password_digest, :string, after: :email

  end

  def down
  	 remove_column :chefs, :password_digest
  end
 	

end

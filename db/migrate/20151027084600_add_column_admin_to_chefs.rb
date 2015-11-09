class AddColumnAdminToChefs < ActiveRecord::Migration
  def up
  	add_column :chefs, :admin, :boolean, default:true ,after: :password_digest
  end

  def down
  	remove_column :chefs, :admin
  end
end

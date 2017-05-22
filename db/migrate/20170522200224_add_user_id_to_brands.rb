class AddUserIdToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :user_id, :integer
  end
end

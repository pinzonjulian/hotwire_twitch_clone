class AddCategoryToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :category, :integer
  end
end

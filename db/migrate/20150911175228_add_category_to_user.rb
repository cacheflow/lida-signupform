class AddCategoryToUser < ActiveRecord::Migration
  def change
    add_column :users, :category, :string
    add_column :users, :subscribe, :boolean
    add_column :users, :offer, :boolean
  end
end

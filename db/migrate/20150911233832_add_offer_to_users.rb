class AddOfferToUsers < ActiveRecord::Migration
  def change
    add_column :users, :offer, :boolean
    add_column :users, :subscribe, :boolean
  end
end

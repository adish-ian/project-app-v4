class AddDescriptionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :string
    add_column :users, :name, :string
  end
end

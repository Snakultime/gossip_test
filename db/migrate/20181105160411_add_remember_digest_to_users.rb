class AddRememberDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remember, :string
    add_column :users, :digest, :string
  end
end

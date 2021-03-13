class RemovePassowordFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :passoword, :string
  end
end

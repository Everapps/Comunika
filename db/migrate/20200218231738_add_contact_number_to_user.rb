# migration for the User model
class AddContactNumberToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :contact_number, :string #add the contact_number field to the User model
  end
end

class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :message
      t.references :user, foreign_key: true
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end

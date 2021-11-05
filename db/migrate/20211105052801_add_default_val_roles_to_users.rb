class AddDefaultValRolesToUsers < ActiveRecord::Migration[5.2]
  # would be wary of doing this in prod with existing column but figured was fine here since new project
  def up
    execute <<-SQL
      CREATE TYPE user_role_types AS ENUM ('tenant', 'owner', 'manager');
    SQL
    change_column :users, :role, :user_role_types, using: 'role::user_role_types', default: "tenant", index: true
  end

  def down
    change_column :users, :role, :string, default: nil
    execute <<-SQL
      DROP TYPE user_role_types;
    SQL
  end
end

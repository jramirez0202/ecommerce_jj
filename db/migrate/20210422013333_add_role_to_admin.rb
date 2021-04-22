class AddRoleToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :role, :string, default: "moderador"

  end
end

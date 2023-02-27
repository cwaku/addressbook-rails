class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :unique_code
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps
    end
  end
end

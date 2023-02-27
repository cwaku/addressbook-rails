class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.string :subject_class
      t.string :action
      t.string :name
      t.string :description
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.text :remarks
      t.references :user, null: false, foreign_key: true
      t.references :suburb, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateSuburbs < ActiveRecord::Migration[7.0]
  def change
    create_table :suburbs do |t|
      t.string :name
      t.text :remarks
      t.references :user, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end

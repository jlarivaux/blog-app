class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.references :recipient, null: false, foreign_key: true
      t.string :type
      t.json :params
      t.datetime :read_at

      t.timestamps
    end
  end
end

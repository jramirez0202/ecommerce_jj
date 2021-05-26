class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :order, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end

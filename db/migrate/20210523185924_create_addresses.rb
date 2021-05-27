class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :fullname
      t.string :city
      t.string :comuna
      t.string :street
      t.integer :number
      t.string :phone
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

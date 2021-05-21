class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :FullName
      t.string :phone
      t.string :email
      t.string :street
      t.string :build
      t.string :place
      t.string :city
      t.string :comuna

      t.timestamps
    end
  end
end

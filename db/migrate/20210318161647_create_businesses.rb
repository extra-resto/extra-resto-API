class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :adress
      t.string :postal_code
      t.string :city
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end

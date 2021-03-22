class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.belongs_to :business, index: true
      t.string :name
      t.datetime :date
      t.string :description
      t.timestamps
    end
  end
end

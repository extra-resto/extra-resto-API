class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.text :dresscode
      t.integer :free_stead
      t.datetime :date
      t.integer :duration
      t.integer :rate
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end

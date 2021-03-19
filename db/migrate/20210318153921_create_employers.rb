class CreateEmployers < ActiveRecord::Migration[6.1]
  def change
    create_table :employers do |t|
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

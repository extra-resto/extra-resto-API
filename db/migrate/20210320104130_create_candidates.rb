class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

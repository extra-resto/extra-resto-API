class CreateCandidatures < ActiveRecord::Migration[6.1]
  def change
    create_table :candidatures do |t|
      t.belongs_to :user, index: true
      t.belongs_to :job, index: true
      t.boolean :hired, default: false

      t.timestamps
    end
  end
end

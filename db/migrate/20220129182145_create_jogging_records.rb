class CreateJoggingRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :jogging_records do |t|
      t.date :date
      t.integer :distance
      t.time :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class ChangeTimeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :jogging_records, :time, :integer
  end
end

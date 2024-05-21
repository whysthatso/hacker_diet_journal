class AddOneTimeToIntakes < ActiveRecord::Migration[7.0]
  def change
    add_column :intakes, :one_time, :datetime
  end
end

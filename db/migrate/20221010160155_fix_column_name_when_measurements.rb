class FixColumnNameWhenMeasurements < ActiveRecord::Migration[7.0]
  def change
    rename_column :measurements, :when, :measured_at
  end
end

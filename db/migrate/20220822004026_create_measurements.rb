class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      t.float :weight
      t.datetime :when

      t.timestamps
    end
  end
end

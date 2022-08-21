class CreateIntakes < ActiveRecord::Migration[7.0]
  def change
    create_table :intakes do |t|
      t.string :description
      t.integer :ean
      t.integer :kcal_per_100

      t.timestamps
    end
  end
end

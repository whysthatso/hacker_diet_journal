class CreateServings < ActiveRecord::Migration[7.0]
  def change
    create_table :servings do |t|
      t.references :intake, null: false, foreign_key: true
      t.datetime :when
      t.integer :kcal
      t.integer :amount

      t.timestamps
    end
  end
end

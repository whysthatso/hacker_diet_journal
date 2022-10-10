class FixColumnNameWhen < ActiveRecord::Migration[7.0]
  def change
    rename_column :servings, :when, :consumed_at
  end
end

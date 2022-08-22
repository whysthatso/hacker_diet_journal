class AddCommonPortionToIntakes < ActiveRecord::Migration[7.0]
  def change
    add_column :intakes, :common_portion, :integer
  end
end

class Intake < ApplicationRecord
  scope :with_common_portion, -> { where("common_portion > 0") }
  has_many :servings
end

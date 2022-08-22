class Intake < ApplicationRecord
  scope :with_common_portion, -> { where("common_portion > 0") }
end

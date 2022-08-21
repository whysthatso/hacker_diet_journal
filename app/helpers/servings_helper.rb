module ServingsHelper
  def intake_description(intake_id)
    Intake.find_by_id(intake_id).description
  end
end

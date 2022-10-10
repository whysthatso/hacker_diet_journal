module MeasurementsHelper
  def weight_over_time
    Measurement.all.map {|m|  [m.consumed_at.strftime("%F"), m.weight] }
  end
end

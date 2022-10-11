module MeasurementsHelper
  def weight_over_time
    Measurement.all.map {|m|  [m.measured_at.strftime("%F"), m.weight] }
  end
end

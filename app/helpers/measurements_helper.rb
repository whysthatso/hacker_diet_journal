module MeasurementsHelper
  def weight_over_time
    Measurement.all.map {|m|  [m.when.strftime("%F"), m.weight] }
  end
end

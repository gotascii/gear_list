class Numeric
  def to_lbs
    (self * 0.0625).to_short_d
  end

  def to_short_d
    self.to_d.truncate(2)
  end
end
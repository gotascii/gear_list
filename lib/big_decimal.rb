class BigDecimal < Numeric
  def to_lbs
    (self * 0.0625).to_d.truncate(2)
  end
end
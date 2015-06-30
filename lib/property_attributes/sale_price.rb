class SalePrice
  CURRENCY = 'GBP'
  def initialize(pounds)
    pence = pounds * 100
    @value = Money.new pence, CURRENCY
  end

  def pounds
    @value.amount.to_f
  end

  def to_s
    @value.format
  end
end

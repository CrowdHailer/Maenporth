class SalePrice
  CURRENCY = 'GBP'

  class << self
    def dump(item)
      item.pounds
    end
  end

  def initialize(pounds)
    pence = pounds.to_f * 100
    @value = Money.new pence, CURRENCY
  end

  def pounds
    @value.amount.to_f
  end

  def to_s
    @value.format
  end

  def ==(other)
    if other.respond_to? :pounds
      pounds == other.pounds
    end
  end
end

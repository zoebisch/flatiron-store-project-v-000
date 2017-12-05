module ApplicationHelper
  def to_format(price)
    price = price/100
    "$" + price.to_s
  end
end

module DealsHelper

  def deal_savings(deal)
    number_to_percentage( ((deal.normal_price.to_f - deal.price.to_f) / deal.normal_price.to_f ) * 100, precision: 0)
  end

end

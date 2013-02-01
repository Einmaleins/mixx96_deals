class SiteController < ApplicationController
  def index
    if params[:category]
      @category = Category.find(params[:category])
      @offers = @category.offers.active
    else
      @offers = Offer.active
    end
  end
end

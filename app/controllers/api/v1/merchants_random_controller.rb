class Api::V1::MerchantsRandomController < Api::BaseController
  def show
    respond_with Merchant.order("RANDOM()").first
  end
end

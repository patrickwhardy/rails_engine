class Api::V1::CustomersFavoriteMerchantsController < Api::BaseController
  def show
    respond_with Customer.find(params[:id]).favorite_merchant
  end
end

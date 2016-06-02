class Api::V1::MerchantsTotalRevenuesController < Api::BaseController
  def show
    respond_with Merchant.total_revenues(params[:date]), serializer: TotalRevenueSerializer
  end
end

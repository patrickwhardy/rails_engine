class Api::V1::CustomersTransactionsController < Api::BaseController
  def index
    respond_with Customer.find(params[:id]).transactions
  end
end

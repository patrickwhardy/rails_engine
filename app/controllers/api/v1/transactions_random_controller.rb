class Api::V1::TransactionsRandomController < Api::BaseController
  def show
    respond_with Transaction.order("RANDOM()").first
  end
end

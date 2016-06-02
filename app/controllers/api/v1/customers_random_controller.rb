class Api::V1::CustomersRandomController < Api::BaseController
  def show
    respond_with Customer.order("RANDOM()").first
  end
end

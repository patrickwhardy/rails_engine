class Api::V1::InvoicesRandomController < Api::BaseController
  def show
    respond_with Invoice.order("RANDOM()").first
  end
end

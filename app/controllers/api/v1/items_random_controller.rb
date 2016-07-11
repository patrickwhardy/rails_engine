class Api::V1::ItemsRandomController < Api::BaseController
  def show
    respond_with Item.order("RANDOM()").first
  end
end

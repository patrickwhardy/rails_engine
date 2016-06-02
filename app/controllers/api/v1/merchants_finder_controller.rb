class Api::V1::MerchantsFinderController < Api::BaseController

  def show
    if params[:name]
      respond_with Merchant.where("lower(name) = ?", params[:name].downcase).first
    else
      respond_with Merchant.find_by(invoice_item_params)
    end
  end

  def index
    if params[:name]
      respond_with Merchant.where("lower(name) = ?", params[:name].downcase)
    else
      respond_with Merchant.where(invoice_item_params)
    end
  end

  private

  def invoice_item_params
    params.permit(:id, :created_at, :updated_at)
  end
end

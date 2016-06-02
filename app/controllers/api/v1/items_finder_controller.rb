class Api::V1::ItemsFinderController < Api::BaseController

  def show
    if params[:name]
      respond_with Item.where("lower(name) = ?", params[:name].downcase).first
    elsif params[:description]
      respond_with Item.where("lower(description) = ?", params[:description].downcase).first
    else
      respond_with Item.find_by(invoice_item_params)
    end
  end

  def index
    if params[:name]
      respond_with Item.where("lower(name) = ?", params[:name].downcase)
    elsif params[:description]
      respond_with Item.where("lower(description) = ?", params[:description].downcase)
    else
      respond_with Item.where(invoice_item_params)
    end
  end

  private

  def unit_price_to_dollars
    params[:unit_price] = params[:unit_price].split('.').join.to_i
  end

  def invoice_item_params
    unit_price_to_dollars if params[:unit_price]
    params.permit(:id, :merchant_id, :unit_price, :created_at, :updated_at)
  end
end

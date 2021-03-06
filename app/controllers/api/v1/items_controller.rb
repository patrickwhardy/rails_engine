class Api::V1::ItemsController < Api::BaseController
  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end
end

class Api::V1::ItemsBestDaysController < Api::BaseController
  def show
    respond_with Item.find(params[:id]).best_day, serializer: ItemBestDaySerializer
  end
end

class Api::V1::CustomersFinderController < Api::BaseController

  def show
    respond_with Customer.find_by(permitted_params)
  end

  def index
    respond_with Customer.where("lower(#{params.keys.first}) = ?", params.keys.first.downcase)
  end

private

  def permitted_params
    params.permit(:id, :created_at, :updated_at)
  end

end

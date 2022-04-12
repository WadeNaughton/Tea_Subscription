class Api::V1::SubscriptionsController < ApplicationController

  def create
    # customer = Customer.find(params[:customer_id])
    # tea = Tea.find(params[:tea_id])
    subscription = Subscription.create!(subscription_params)
    render json: SubscriptionsSerializer.new(subscription), status: 201

  end

  def update
    subscription = Subscription.find_by(id: params[:id])
    if subscription == nil
        render json: {error: "Bad Request"}, status: 404
    else
      subscription.update(subscription_params)
      render json: SubscriptionsSerializer.new(subscription), status: 200
    end
  end


  private

  def subscription_params

    params.permit( :title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end

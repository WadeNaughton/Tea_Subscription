class Api::V1::SubscriptionsController < ApplicationController

  def index
    subscriptions = Subscription.all
    subscription = subscriptions.uniq_subs
    render json: UniqueSubscriptionsSerializer.new(subscription), status: 200
  end

  def create
    customer = Customer.find_by(id: params[:customer_id])
    tea = Tea.find_by(id: params[:tea_id])
    if customer == nil || tea == nil
      render json: {error: "Bad Request"}, status: 404
    else
      subscription = Subscription.create!(subscription_params)
      render json: SubscriptionsSerializer.new(subscription), status: 201
    end
  end

  def update
    subscription = Subscription.find_by(id: params[:id])
    if subscription == nil
        render json: {error: "Bad Request"}, status: 404
    else
      subscription.update(status: params[:status])
      render json: SubscriptionsSerializer.new(subscription), status: 200
    end
  end


  private

  def subscription_params

    params.permit( :title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end

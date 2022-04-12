class Api::V1::CustomerController < ApplicationController

  def show
    # require "pry"; binding.pry

    customer = Customer.find(params[:id])
    subscription = customer.subs
    render json: SubscriptionsSerializer.new(subscription), status: 200
  end

end

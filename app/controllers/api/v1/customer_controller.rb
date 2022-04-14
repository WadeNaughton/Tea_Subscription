class Api::V1::CustomerController < ApplicationController


  def index
    customer = Customer.all
    render json: CustomerSerializer.new(customer), status: 200

  end

  def show
    customer = Customer.find(params[:id])
    subscription = customer.subs
    render json: SubscriptionsSerializer.new(subscription), status: 200
  end

  def create
    new_customer = Customer.find_by(email: params[:email])
    if new_customer.present?
      render json: {error: "Customer already exists"}, status: 404
    else
      customer = Customer.create(customer_params)
      render json: CustomerSerializer.new(customer), status: 201
    end
  end

  private

  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end

end

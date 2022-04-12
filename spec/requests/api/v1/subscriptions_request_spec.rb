require 'rails_helper'

RSpec.describe 'subscription requests' do
  it 'posts a subscription' do
    customer = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
    tea1 = Tea.create(title: "Wades Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")

    post '/api/v1/subscriptions', params: { title: 'Testtest', price: 3.00, status: "active", frequency: 'weekly', customer_id: customer.id, tea_id: tea1.id }
    subscription = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(subscription).to be_a Hash
  end

  # it "updates a subscription" do
  #   customer = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
  #   tea1 = Tea.create(title: "Wades Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")
  #
  #   post '/api/v1/subscriptions', params: { title: 'Testtest', price: 3.00, status: "active", frequency: 'weekly', customer_id: customer.id, tea_id: tea1.id }
  #   test = JSON.parse(response.body, symbolize_names: true)
  #   require "pry"; binding.pry
  #
  #   data
  #
  #   patch '/api/v1/subscriptions/:id', params: {subscription_id: test[:data][:id]}
  #   test1 = JSON.parse(response.body, symbolize_names: true)
  #
  # end
end

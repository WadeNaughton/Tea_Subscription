require 'rails_helper'

RSpec.describe 'customer requests' do
  it 'returns all customer subscriptions' do
    customer = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
    tea1 = Tea.create(title: "Wades Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")
    tea2 = Tea.create(title: "Test Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")

    sub1 = Subscription.create(title: " First sub ", price: 4.50, status: "active", frequency: " monthly", customer_id: customer.id, tea_id: tea1.id)
    sub2 = Subscription.create(title: " second sub ", price: 10.00, status: "deactivated", frequency: " weekly", customer_id: customer.id, tea_id: tea2.id)
    get '/api/v1/customer/:id', params: { customer_id: customer.id }
    subscription = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(subscription).to be_a Hash
  end
end

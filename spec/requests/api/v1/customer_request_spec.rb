require 'rails_helper'

RSpec.describe 'customer requests' do
  it 'returns all subscriptions for a single customer' do
    customer = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
    customer2 = Customer.create(first_name: "paul", last_name: "People", address: "123 rd", email: "b@peterson.com" )
    tea1 = Tea.create(title: "Wades Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")
    tea2 = Tea.create(title: "Test Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")

    sub1 = Subscription.create(title: " First sub ", price: 4.50, status: "active", frequency: " monthly", customer_id: customer.id, tea_id: tea1.id)
    sub2 = Subscription.create(title: " second sub ", price: 10.00, status: "deactivated", frequency: " weekly", customer_id: customer.id, tea_id: tea2.id)
    sub3 = Subscription.create(title: " second sub ", price: 10.00, status: "deactivated", frequency: " weekly", customer_id: customer2.id, tea_id: tea2.id)

    get "/api/v1/customer", params: { id: customer.id }
    subscription = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(subscription).to be_a Hash
    expect(subscription[:data].length).to eq(2)
  end

  it "returns all customers" do

    customer1 = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
    customer2 =Customer.create(first_name: "Devin", last_name: "People", address: "456 st", email: "d@pile.com" )
    customer3 =Customer.create(first_name: "Jessica", last_name: "Human", address: "789 blvd", email: "j@organ.com" )
    customer4 =Customer.create(first_name: "Joel", last_name: "Bro", address: "101112 cir", email: "j@grant.com" )
    customer5 =Customer.create(first_name: "Josh", last_name: "Dude", address: "131415 ave", email: "j@walsh.com" )
    get "/api/v1/customers"
    customers = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(customers).to be_a Hash
    expect(customers[:data].length).to eq(5)

  end

  it "can create a customer" do
    post "/api/v1/customer", params: { first_name: 'New', last_name: 'guy', email: "new@guy.com", address: "1234 ave" }
    customer = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(customer).to be_a Hash
  end

  it "returns 404 when customer email already exists" do
    customer1 = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
    post "/api/v1/customer", params: { first_name: 'New', last_name: 'guy', email: "b@peterson.com", address: "1234 ave" }
    expect(response).to_not be_successful
    expect(response.status).to eq(404)
  end
end

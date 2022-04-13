require 'rails_helper'

RSpec.describe 'subscription requests' do
  describe 'happy path' do
    it 'posts a subscription' do
      customer = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
      tea1 = Tea.create(title: "Wades Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")

      post '/api/v1/subscriptions', params: { title: 'Testtest', price: 3.00, status: "active", frequency: 'weekly', customer_id: customer.id, tea_id: tea1.id }
      subscription = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(subscription).to be_a Hash
    end

    it "updates a subscription" do
      customer = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
      tea1 = Tea.create(title: "Wades Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")

      post '/api/v1/subscriptions', params: { title: 'Testtest', price: 3.00, status: "active", frequency: 'weekly', customer_id: customer.id, tea_id: tea1.id }
      test = JSON.parse(response.body, symbolize_names: true)


      patch "/api/v1/subscriptions/#{Subscription.last.id}", params: { title: 'Testtest', price: 3.00, status: "deactived", frequency: 'weekly', customer_id: customer.id, tea_id: tea1.id}
      test1 = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(test1).to be_a Hash
    end
  end

  describe 'sad path' do
    it "returns 404 when the patch request has bad id" do
      customer = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
      tea1 = Tea.create(title: "Wades Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")

      post '/api/v1/subscriptions', params: { title: 'Testtest', price: 3.00, status: "active", frequency: 'weekly', customer_id: customer.id, tea_id: tea1.id }

      patch "/api/v1/subscriptions/10000000", params: { title: 'Testtest', price: 3.00, status: "deactived", frequency: 'weekly', customer_id: customer.id, tea_id: tea1.id}

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end

    it "returns 404 when tea does not exist /post" do
      customer = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
      tea1 = Tea.create(title: "Wades Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")

      post '/api/v1/subscriptions', params: { title: 'Testtest', price: 3.00, status: "active", frequency: 'weekly', customer_id: customer.id }
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end

    it "returns 404 when customer does not exist /post" do
      customer = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
      tea1 = Tea.create(title: "Wades Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")

      post '/api/v1/subscriptions', params: { title: 'Testtest', price: 3.00, status: "active", frequency: 'weekly', tea_id: tea1.id }
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end

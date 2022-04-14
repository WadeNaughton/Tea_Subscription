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

    it "returns every unique subscriptions" do
      customer1 = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
     customer2 =Customer.create(first_name: "Devin", last_name: "People", address: "456 st", email: "d@pile.com" )
     customer3 =Customer.create(first_name: "Jessica", last_name: "Human", address: "789 blvd", email: "j@organ.com" )
     customer4 =Customer.create(first_name: "Joel", last_name: "Bro", address: "101112 cir", email: "j@grant.com" )
     customer5 =Customer.create(first_name: "Josh", last_name: "Dude", address: "131415 ave", email: "j@walsh.com" )

     tea1 = Tea.create(title: "Wades Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")
     tea2 = Tea.create(title: "Bretts Tea ", description: "tea time", temp: 55, brew_time: "10 minute")
     tea3 = Tea.create(title: "Macks Tea ", description: " Tea from you to me ", temp: 65, brew_time: "11 minute")
      sub1 = Subscription.create(title: " second sub ", price: 4.50, status: "active", frequency: " monthly", customer_id: customer1.id, tea_id: tea1.id)
      sub2 = Subscription.create(title: " second sub ", price: 5.50, status: "active", frequency: " monthly", customer_id: customer2.id, tea_id: tea3.id)
      sub3 = Subscription.create(title: " third sub ", price: 6.50, status: "active", frequency: " monthly", customer_id: customer3.id, tea_id: tea1.id)
      sub4 = Subscription.create(title: " fourth sub ", price: 7.50, status: "active", frequency: " monthly", customer_id: customer1.id, tea_id: tea2.id)
      get "/api/v1/subscriptions"
      data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(data).to be_a Hash
      expect(data[:data].length).to eq(3)
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

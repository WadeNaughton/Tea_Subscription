Customer.destroy_all
Subscription.destroy_all
Tea.destroy_all

customer1 = Customer.create(first_name: "Brian", last_name: "Person", address: "123 rd", email: "b@peterson.com" )
customer2 =Customer.create(first_name: "Devin", last_name: "People", address: "456 st", email: "d@pile.com" )
customer3 =Customer.create(first_name: "Jessica", last_name: "Human", address: "789 blvd", email: "j@organ.com" )
customer4 =Customer.create(first_name: "Joel", last_name: "Bro", address: "101112 cir", email: "j@grant.com" )
customer5 =Customer.create(first_name: "Josh", last_name: "Dude", address: "131415 ave", email: "j@walsh.com" )

tea1 = Tea.create(title: "Wades Tea ", description: " sweet tea", temp: 45, brew_time: "1 minute")
tea2 = Tea.create(title: "Bretts Tea ", description: "tea time", temp: 55, brew_time: "10 minute")
tea3 = Tea.create(title: "Macks Tea ", description: " Tea from you to me ", temp: 65, brew_time: "11 minute")

sub1 = Subscription.create(title: " First sub ", price: 4.50, status: "active", frequency: " monthly", customer_id: customer1.id, tea_id: tea1.id)
sub2 = Subscription.create(title: " second sub ", price: 5.50, status: "active", frequency: " monthly", customer_id: customer2.id, tea_id: tea3.id)
sub3 = Subscription.create(title: " third sub ", price: 6.50, status: "active", frequency: " monthly", customer_id: customer3.id, tea_id: tea1.id)
sub4 = Subscription.create(title: " fourth sub ", price: 7.50, status: "active", frequency: " monthly", customer_id: customer1.id, tea_id: tea2.id)

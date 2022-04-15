# README
![Screen Shot 2022-04-15 at 9 34 16 AM](https://user-images.githubusercontent.com/90228086/163577059-683fa789-4129-4b8f-abc9-5143eb30b013.png)

# Background

Tea Subscription is a backend rails application that provides API endpoints to a figurative frontend team. The frontend team would be able to use the endpoints in this project to create a tea, create a customer, create a subscription, edit a subscription, return all of a customers subscriptions, return all unique subscriptions, and return all users.

# Gems
- capybara
- rspec-rails
- simplecov
- shoulda-matchers
- launchy
- jsonapi-serializer
- pry

# Setup

1. Clone down this repository

```
git clone git@github.com:WadeNaughton/tea_subscription.git
```

2. CD into the project

```
cd tea_subscription
```

3. Open the project and run bundle install

```
bundle install
```

4. Create and migrate the database

```
rails db:{create,migrate}
```

5. If you wish to remove your data and start over, add drop to the command above.

```
rails db:{drop,create,migrate}
```

# Schema
<img width="763" alt="Screen Shot 2022-04-13 at 11 29 23 AM" src="https://user-images.githubusercontent.com/90228086/163216083-1764cd14-8d41-4212-b801-516aa1d30bd6.png">

# Example Endpoints

- /POST a new subscription

```
{
    "data": {
        "id": "11",
        "type": "subscriptions",
        "attributes": {
            "title": "TEST",
            "price": 500.0,
            "status": "active",
            "frequency": "monthly",
            "customer_id": 2,
            "tea_id": 5
        }
    }
}
```
- /PATCH a subscription

```
{
    "data": {
        "id": "11",
        "type": "subscriptions",
        "attributes": {
            "title": "TEST",
            "price": 500.0,
            "status": "deactivated",
            "frequency": "monthly",
            "customer_id": 2,
            "tea_id": 5
        }
    }
}
```

- /GET a single customers subscriptions

```
{
    "data": [
        {
            "id": "12",
            "type": "subscriptions",
            "attributes": {
                "title": "TEST",
                "price": 500.0,
                "status": "active",
                "frequency": "monthly",
                "customer_id": 3,
                "tea_id": 5
            }
        },
        {
            "id": "13",
            "type": "subscriptions",
            "attributes": {
                "title": "TEST",
                "price": 500.0,
                "status": "active",
                "frequency": "monthly",
                "customer_id": 3,
                "tea_id": 3
            }
        }
    ]
}
```

- /GET all customers

```
{
    "data": [
        {
            "id": "1",
            "type": "customer",
            "attributes": {
                "first_name": "BOB",
                "last_name": "Bill",
                "email": "bob@bill.com",
                "address": "street"
            }
        },
        {
            "id": "2",
            "type": "customer",
            "attributes": {
                "first_name": "BOB",
                "last_name": "Bill",
                "email": "bob@bill.com",
                "address": "stree"
            }
        },
        {
            "id": "3",
            "type": "customer",
            "attributes": {
                "first_name": "wade",
                "last_name": "Bill",
                "email": "bob@bill.com",
                "address": "street"
            }
        }
       ]
}
```

- /POST new customer

```
{
    "data": {
        "id": "10",
        "type": "customer",
        "attributes": {
            "first_name": "README",
            "last_name": "EXAMPLE",
            "email": "newcustomer2@customer.com",
            "address": "read st ME"
        }
    }
}
```

- /POST  new tea

```
{
    "data": {
        "id": "7",
        "type": "tea",
        "attributes": {
            "title": "READEME TEA ",
            "description": "thhis is an example for a readme",
            "temp": 100,
            "brew_time": "2 hours"
        }
    }
}
```

- /GET unique subscriptions

```
{
    "data": [
        {
            "id": "12",
            "type": "unique_subscriptions",
            "attributes": {
                "title": "TEST",
                "price": 500.0,
                "status": "active",
                "frequency": "monthly"
            }
        },
        {
            "id": "1",
            "type": "unique_subscriptions",
            "attributes": {
                "title": "test",
                "price": 4.5,
                "status": "active",
                "frequency": "montly"
            }
        },
        {
            "id": "8",
            "type": "unique_subscriptions",
            "attributes": {
                "title": "this is a test",
                "price": 4.5,
                "status": "active",
                "frequency": "montly"
            }
        }
    ]
}
```




require 'rails_helper'

describe 'Recipient' do
  before(:each) do
    @user1 = User.create(name: "Clayton", username: "Tester", email: "me@example", password_digest: "password", city: "Chicago")
    @user2 = User.create(name: "Mrs. Adolfo Fadel", username: "rosalee_renner", email: "jaron.mohr@blicklakin.info", password_digest: "password", city: "East Kaden")
    @delivery = Delivery.create(carrier_id: 1, sender_id: 2, recipient_id: 1, package_size: "Large", from_city: "Chicago", to_city: "Austin", price: 20, departure_date: Date.today, arrival_date: Date.tomorrow)
    @recipient = Recipient.create(user_id: 2, name: "Theo", email: "test")
  end
end

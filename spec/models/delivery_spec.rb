require 'rails_helper'

describe Delivery do

  it { should validate_presence_of(:carrier_id) }
  it { should validate_presence_of(:sender_id) }
  it { should validate_presence_of(:recipient_id) }
  it { should validate_presence_of(:package_size) }
  it { should validate_presence_of(:from_city) }
  it { should validate_presence_of(:to_city) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:departure_date) }

  it { should validate_numericality_of(:carrier_id) }
  it { should validate_numericality_of(:sender_id) }
  it { should validate_numericality_of(:recipient_id) }
  it { should validate_numericality_of(:price) }

  it { should belong_to(:carrier).class_name('User').with_foreign_key('carrier_id') }
  it { should belong_to(:sender).class_name('User').with_foreign_key('sender_id') }
  it { should belong_to(:recipient) }

  before(:each) do
    @user1 = User.create(name: "Clayton", username: "Tester", email: "me@example", password_digest: "password", city: "Chicago")
    @user2 = User.create(name: "Mrs. Adolfo Fadel", username: "rosalee_renner", email: "jaron.mohr@blicklakin.info", password_digest: "password", city: "East Kaden")
    @delivery = Delivery.create(carrier_id: 1, sender_id: 2, recipient_id: 1, package_size: "Large", from_city: "Chicago", to_city: "Austin", price: 20, departure_date: Date.today, arrival_date: Date.tomorrow)
    @recipient = Recipient.create(user_id: 2, name: "Theo", email: "test")
  end

  it "should show that the delivery's carrier is 'Clayton'" do
    expect(@delivery.carrier.name).to eq('Clayton')
  end

  it "should show that the delivery's sender is 'Mrs. Adolfo Fadel'" do
    expect(@delivery.sender.name).to eq('Mrs. Adolfo Fadel')
  end

  it "should show that the delivery's recipient is 'Theo'" do
    expect(@delivery.recipient.name).to eq('Theo')
  end
end

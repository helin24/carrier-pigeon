require 'rails_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password_digest) }

  it { should belong_to(:delivery) }
  it { should have_many(:carried_deliveries).class_name('Delivery').with_foreign_key('carrier_id') }
  it { should have_many(:sent_deliveries).class_name('Delivery').with_foreign_key('sender_id') }
  it { should have_many(:recipients) }

  before(:each) do
    @user1 = User.create(name: "Clayton", username: "Tester", email: "me@example", password_digest: "password", city: "Chicago")
    @user2 = User.create(name: "Mrs. Adolfo Fadel", username: "rosalee_renner", email: "jaron.mohr@blicklakin.info", password_digest: "password", city: "East Kaden")
    @delivery = Delivery.create(carrier_id: 1, sender_id: 2, recipient_id: 1, package_size: "Large", from_city: "Chicago", to_city: "Austin", price: 20, departure_date: Date.today, arrival_date: Date.tomorrow)
    @recipient = Recipient.create(user_id: 2, name: "Theo", email: "test")
  end

  it 'assigns carried delivery' do
    expect(@user1.carried_deliveries.size).to eq(1)
    expect(@user1.sent_deliveries.size).to eq(0)
  end

  it 'should show user2 with a single sent delivery' do
    expect(@user2.sent_deliveries.size).to eq(1)
  end

  it 'should show that user2 has one recipient' do
    expect(@user2.recipients.size).to eq(1)
  end
end

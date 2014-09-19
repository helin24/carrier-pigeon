class Delivery < ActiveRecord::Base
  belongs_to :carrier,  class_name: "User", foreign_key: :carrier_id
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :recipient

  validates :carrier_id, presence: true, numericality: true
  validates :sender_id, presence: true, numericality: true
  validates :recipient_id, presence: true, numericality: true
  validates :package_size, presence: true
  validates :from_city, presence: true
  validates :to_city, presence: true
  validates :price, presence: true, numericality: true
  validates :departure_date, presence: true

end

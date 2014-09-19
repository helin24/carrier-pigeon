class User < ActiveRecord::Base
	belongs_to :delivery
  has_many :carried_deliveries, class_name: "Delivery", foreign_key: :carrier_id
  has_many :sent_deliveries, class_name: "Delivery", foreign_key: :sender_id
  has_many :recipients
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true


	has_secure_password

  def carrier_rating
  end

  def sender_rating
  end
end

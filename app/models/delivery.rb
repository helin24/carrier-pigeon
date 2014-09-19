class Delivery < ActiveRecord::Base
  belongs_to :carrier,  class_name: "User", foreign_key: :carrier_id
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :recipient
end

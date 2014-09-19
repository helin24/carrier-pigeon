class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
    	t.integer :carrier_id
    	t.integer :sender_id
    	t.integer :recipient_id
    	t.string  :package_size
    	t.string  :from_city
    	t.string  :to_city
    	t.integer :price
    	t.datetime :departure_date
    	t.datetime :arrival_date

      t.timestamps
    end
  end
end

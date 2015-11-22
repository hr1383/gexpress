class OrderController < ApplicationController

	def create
		# shipping_address = params['shipping_address']
		billing =  params['billing']
		sku = params['sku']
		order = Order.new(:lname => billing['lname'],
						  :fname => billing['fname'],
						  :sku_model => sku['device'],
						  :sku_memory => sku['size'],
						  :sku_state => sku['state'],
						  :sku_carrier => sku['carrier'],
						  :payment_method => params['payment_method'],
						  # :shipping_addr => shipping_address['addr'],
						  # :shipping_addr1 => shipping_address['addr1'],
						  # :shipping_city => shipping_address['city'],
						  # :shipping_state => shipping_address['state'],
						  # :shipping_zipcode => shipping_address['zip'],
						  # :shipping_phone => shipping_address['phone'],
						  # :shipping_email => shipping_address['email'],
						  :billing_addr => billing['addr'],
						  :billing_addr1 => billing['addr1'],
						  :billing_city => billing['city'],
						  :billing_state => billing['state'],
						  :billing_zipcode => billing['zip'],
						  :billing_phone => billing['phone'],
						  :billing_email => billing['email'],
						  :paypal_email => billing['paypalemail'],
						  :created_at => Time.now.strftime("%d/%m/%Y %H:%M"),
						  :order_status => 'NEW')
		order.save
		if Rails.env.production?
			Emailer.email_admin(order).deliver
			if order.payment_method == 'check'
				Emailer.new_order(order.order_id, order.paypal_email)
			else 	
				Emailer.new_order(order.order_id, order.billing_email)
			end	
		end
		respond_to do |format|    	
    		format.json  { render :json => order.to_json }
		end
	end
end
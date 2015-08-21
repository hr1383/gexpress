class OrderController < ApplicationController

	def create
		shipping_address = params['shipping_address']
		billing =  params['billing']
		sku = params['sku']
		order = Order.new(:lname => shipping_address['lname'],
						  :fname => shipping_address['fname'],
						  :sku_model => sku['device'],
						  :sku_size => sku['size'],
						  :sku_memory => sku['size'],
						  :sku_state => sku['state'],
						  :sku_carrier => sku['carrier'],
						  :payment_method => params['payment_method'],
						  :shipping_addr => shipping_address['addr'],
						  :shipping_addr1 => shipping_address['addr1'],
						  :shipping_city => shipping_address['city'],
						  :shipping_state => shipping_address['state'],
						  :shipping_zipcode => shipping_address['zip'],
						  :shipping_phone => shipping_address['phone'],
						  :shipping_email => shipping_address['email'],
						  :billing_addr => billing['addr'],
						  :billing_addr1 => billing['addr1'],
						  :billing_city => billing['city'],
						  :billing_state => billing['state'],
						  :billing_zipcode => billing['zip'],
						  :billing_phone => billing['phone'],
						  :billing_email => billing['email'],
						  :paypal_email => billing['paypalemail'],
						  :order_status => 'NEW')
		order.save
		respond_to do |format|    	
    		format.json  { render :json => '' }
		end
	end
end
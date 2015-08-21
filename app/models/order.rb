class Order
  include Mongoid::Document
  field  :order_id
  field :fname
  field :lname
  field :sku_model
  field :sku_size
  field :sku_memory
  field :sku_state
  field :sku_carrier
  field :payment_method
  field :shipping_addr
  field :shipping_addr1
  field :shipping_city
  field :shipping_state
  field :shipping_zipcode
  field :shipping_email
  field :shipping_phone
  field :billing_addr
  field :billing_addr1
  field :billing_city
  field :billing_state
  field :billing_zipcode
  field :billing_phone
  field :billing_email
  field :paypal_email
  field :order_status
  field :created_at, :type => Date
  field :shipped_on, :type => Date
  field :received_on, :type => Date

  after_initialize :add_orderid
  def add_orderid
  	puts "hell"
  	self.order_id = loop do
  		token = SecureRandom.urlsafe_base64
  		break token unless Order.where(order_id: token).count != 0
	end
  end
end

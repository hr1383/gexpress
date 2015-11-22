class Emailer < MandrillMailer::TemplateMailer
	default from: ENV['FROM_MAIL']

	def new_order(order_id, email)
    mandrill_mail template: 'gexpress-admin',
                  to: email,
                  async: true,
                  vars: {
                     'ORDER_ID' => order_id
                    },              
                  important: true,
                  inline_css: true           
  end

  def email_admin(order)
    mandrill_mail template: 'gexpress-admin',
                  subject: 'New order at your door',
                  to: ENV['TO_ADMIN_MAIL'].split(","),
                  async: true,
                  vars: {
                    'ORDER_ID' => order.order_id,
                    'CUST_NAME' => order.fname + " " + order.lname,
                    'SKU_MODEL' => order.sku_model,
                    'SKU_MEMORY' => order.sku_memory,
                    'SKU_STATE' => order.sku_state,
                    'SKU_CARRIER' => order.sku_carrier,
                    'PAYMENT_METHOD' => order.payment_method,
                    'CREATED_AT' => order.created_at
                  },
                  important: true,
                  inline_css: true           
  end
end
class Emailer < MandrillMailer::TemplateMailer
	default from: ENV['FROM_MAIL']

	def new_order
    mandrill_mail template: 'gexpress-new',
                  subject: 'Thanks for signing up',
                  to: ENV['TO_MAIL'],
                  vars: {
                    'ORDER' => '123'
                  },                  
                  important: true,
                  inline_css: true           
  end
end
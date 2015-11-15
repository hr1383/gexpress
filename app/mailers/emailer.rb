class Emailer < MandrillMailer::TemplateMailer
	default from: ENV['FROM_MAIL']

	def new_order
    mandrill_mail template: 'gexpress-new',
                  subject: 'Thanks for signing up',
                  to: ENV['TO_MAIL'],
                  # vars: {
                  #   'FIRST_NAME' => user.firstname
                  # },
                  vars: {
                    'ORDER' => 1232
                  },
                  important: true,
                  inline_css: true                  
    puts "sent an email"                  
  end
end
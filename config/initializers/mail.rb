ActionMailer::Base.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :user_name =>  'hrsht.rastogi13@gmail.com',
    # ENV['MANDRILL_USERNAME'],
    :password  => 'NlUT51_5lNYpsZub9IHLhw',
    # ENV['MANDRILL_API_KEY'],
    :domain    => 'heroku.com'
  }
ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = 'NlUT51_5lNYpsZub9IHLhw'
  # ENV['MANDRILL_API_KEY']
end
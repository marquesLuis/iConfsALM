# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
IConfs::Application.initialize!

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address            => 'smtp.gmail.com',
    :port               => "587",
    :tls                  => false,
    :domain             => 'gmail.com', #you can also use google.com
    :authentication     => :login,
    :user_name => 'g03pi1213@gmail.com',
    :password => '123,123,'
}

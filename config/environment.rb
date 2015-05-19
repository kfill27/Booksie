# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings = {
#   :user_name => ENV['SENDGRID_USERNAME'],  ## Refer to key SENDGRID_USERNAME
#   :password => ENV['SENDGRID_PASSWORD'],  ## Refer to key SENDGRID_PASSWORD
#   :domain => 'booksie.co',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'],  ## Refer to key SENDGRID_USERNAME
  :password => ENV['SENDGRID_PASSWORD'],  ## Refer to key SENDGRID_PASSWORD
  :domain => 'booksie.co',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

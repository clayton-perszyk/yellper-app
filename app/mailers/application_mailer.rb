class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  default_url_options[:host] = "localhost:3000" if Rails.env.development?

end

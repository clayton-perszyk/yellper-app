class ApplicationMailer < ActionMailer::Base
  default from: "help@yellper.com"
  default_url_options[:host] = "localhost:3000"
end

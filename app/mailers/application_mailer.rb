class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.gmail_username
  layout 'mailer'
end

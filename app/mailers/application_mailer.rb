class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

    def welcome(user)
      mail(to: user.email, subject: default_i18n_subject(user: user.name))
    end

end

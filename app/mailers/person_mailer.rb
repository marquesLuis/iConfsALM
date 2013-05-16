class PersonMailer < ActionMailer::Base
  default from: "g03pi1213@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.person_mailer.send_code.subject
  #
  def send_code(person)
    @person=person

    mail to: person.email
  end
end

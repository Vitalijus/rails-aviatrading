class UserMailer < ActionMailer::Base
  default from: "info@aviatrading.com"

  def new_customer_subscription(user)
    @user = user

    mail(to: "vitalij.desuk@gmail.com", subject: 'You have been subscribed')
  end
end

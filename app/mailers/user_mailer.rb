class UserMailer < ActionMailer::Base
  default from: "info@aviatrading.com"

  def new_customer_subscription(user)
    @user = user

    mail(to: "info@aviatrading.com", subject: 'You have been subscribed')
  end
end

class UserMailer < ActionMailer::Base
  default from: "info@aviatrading.com"

  def customer_subscription_created(customer_email, subscription_created, trial_end, 
                                    plan_interval, plan_name, plan_price)
    @customer_email = customer_email
    @subscription_created = subscription_created
    @trial_end = trial_end
    @plan_interval = plan_interval
    @plan_name = plan_name
    @plan_price = plan_price

    mail(to: @customer_email, 
         subject: "Thanks for choosing AviaTrading! Subscription is activated.",
         bcc: "info@aviatrading.com")
  end

  def charge_succeeded(customer_email)
    @customer_email = customer_email
    mail(to: @customer_email, 
         subject: "AviaTrading billing. Charge succeeded.",
         bcc: "info@aviatrading.com")
  end

  def invoice_payment_failed(customer_email)
    @customer_email = customer_email
    mail(to: @customer_email, 
         subject: "Your AviaTrading subscription has been suspended",
         bcc: "info@aviatrading.com")
  end

  def customer_subscription_trial_will_end(customer_email)
    @customer_email = customer_email
    mail(to: @customer_email, 
         subject: "Don't forget to add billing information for AviaTrading",
         bcc: "info@aviatrading.com")
  end
end

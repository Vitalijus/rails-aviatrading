class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover_image, CoverUploader

  has_many :adverts, dependent: :destroy
  has_one :order, dependent: :destroy
  belongs_to :plan

  #validates_presence_of :plan_id

  attr_accessor :stripe_card_token

  #def coupon_code
  #  customer = Stripe::Customer.retrieve("#{stripe_customer_token}")
  #  customer.coupon = coupon
  #  customer.save
  #end

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: "Subscription plan: #{name_on_card}",
                                         email: email,
                                         plan: plan_id, 
                                         card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end

  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false

  rescue Stripe::CardError => e
    logger.error "Card error #{e.message}"
    errors.add :base, "Your card is not supported. Card error"
    false

  rescue Stripe::APIError => e
    logger.error "Card error #{e.message}"
    errors.add :base, "Network communication with Stripe billin system failed"
    false

  rescue => e
    logger.error "Card error #{e.message}"
    errors.add :base, "Something went wrong. This error prohibited order from being saved"
    false

  end


  def cancel_user_plan(customer_id)
      customer = Stripe::Customer.retrieve("#{customer_id}")
      customer.cancel_subscription
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while deleting customer: #{e.message}"
      errors.add :base, "No active subscriptions for user."
      false
  end

  def email_check
    a = self.email
    a.split("@").first
  end

  def to_param
	 "#{id} #{email_check}".parameterize
  end
end

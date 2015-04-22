class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover_image, CoverUploader

  has_many :adverts, dependent: :destroy
  belongs_to :plan

  accepts_nested_attributes_for :adverts, allow_destroy: true
  #, :reject_if => lambda { |a| a[:show_advert].blank? }

  validates_presence_of :plan_id
  #validates_presence_of :coupon
  #validate :validate_for_coupon

  attr_accessor :stripe_card_token

  def validate_for_coupon
    unless coupon.blank? or coupon == '38710141505'
      errors[:base] << "Your discount number is incorrect" 
    end 
  end

  def trial_timestamp
    Time.now.to_i + 604800 #current time + one week in seconds 
  end

# create a customer and subscription without credit card info
  def create_customer
    if valid?
        customer = Stripe::Customer.create(description: "Customer subscribed without setup billing",
                                           email: email,
                                           plan: plan_id,
                                           trial_end: "#{trial_timestamp}")
        self.stripe_customer_token = customer.id
        self.stripe_subscription_token = customer.subscriptions.first.id
        save!
    end

    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "Sorry, something went wrong. Try again or contact us at info@aviatrading.com."
      false
  end

# retrieve a customer and create source for credit card info
  def setup_user_billing(customer_id, stripe_card_token, coupon_id)
    if valid?
      unless coupon.blank? or coupon != "38710141505"
        customer = Stripe::Customer.retrieve("#{customer_id}")
        customer.sources.create(source: stripe_card_token)
        customer.description = "Customer subscribed with setup billing and coupon"
        customer.coupon = "#{coupon_id}"
        customer.save
      else
        customer = Stripe::Customer.retrieve("#{customer_id}")
        customer.sources.create(source: stripe_card_token)
        customer.description = "Customer subscribed with setup billing"
        customer.save
      end
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
    errors.add :base, "Something went wrong. This error prohibited user from being saved"
    false
  end

# retrieve a customer and swith between PREMIUM and BASIC plan
  def change_user_plan(customer_id, subscription_id)
    if valid?
      if plan_id == 1
        customer = Stripe::Customer.retrieve("#{customer_id}")
        subscription = customer.subscriptions.retrieve("#{subscription_id}")
        subscription.plan = 2
        subscription.save
      elsif plan_id == 2
        customer = Stripe::Customer.retrieve("#{customer_id}")
        subscription = customer.subscriptions.retrieve("#{subscription_id}")
        subscription.plan = 1
        subscription.save
      end
    end

  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while changing plan: #{e.message}"
    errors.add :base, "There was a problem with changing your plan."
    false

  rescue Stripe::CardError => e
    logger.error "Card error #{e.message}"
    errors.add :base, "Your card is not supported. Card error"
    false

  rescue Stripe::APIError => e
    logger.error "Card error #{e.message}"
    errors.add :base, "Network communication with billing system failed"
    false

  rescue => e
    logger.error "Card error #{e.message}"
    errors.add :base, "Something went wrong. This error prohibited user from being saved"
    false
  end

# retrieve a customer and setup new subscription with billing.
  def subscribe_existing_customer(customer_id, stripe_card_token, plan_id)
      if valid?
        customer = Stripe::Customer.retrieve("#{customer_id}")
        customer.sources.create(source: stripe_card_token)
        customer.description = "Customer subscribed with setup billing"
        customer.plan = "#{plan_id}"
        customer.save

        self.stripe_subscription_token = customer.subscriptions.first.id
        save!
      end

      rescue Stripe::InvalidRequestError => e
        logger.error "Stripe error while creating customer: #{e.message}"
        errors.add :base, "Sorry, error happend. Try again or contact us info@aviatrading.com"
        false
  end

# retrieve customer and calcel subscription
  def cancel_user_plan(customer_id)
      customer = Stripe::Customer.retrieve("#{customer_id}")
      customer.cancel_subscription
      customer.description = "Canceled subscription"
      customer.save

    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while deleting customer: #{e.message}"
      errors.add :base, "Sorry, error happend. Try again or contact us info@aviatrading.com"
      false
  end
  
end

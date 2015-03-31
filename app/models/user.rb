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

  #validates_presence_of :plan_id
  validate :validate_for_coupon

  attr_accessor :stripe_card_token

  #def coupon_code
  #  customer = Stripe::Customer.retrieve("#{stripe_customer_token}")
  #  customer.coupon = coupon
  #  customer.save
  #end

  def validate_for_coupon
    unless coupon.blank? or coupon == '38710141505'
      errors[:base] << "Your discount number is incorrect" 
    end 
  end

  def save_with_payment
    if valid?
      unless coupon.blank? or coupon != "38710141505"
        customer = Stripe::Customer.create(description: "#{name_on_card}",
                                           email: email,
                                           plan: plan_id,
                                           coupon: coupon,
                                           card: stripe_card_token)
        self.stripe_customer_token = customer.id
        save!
      else
        customer = Stripe::Customer.create(description: "#{name_on_card}",
                                           email: email,
                                           plan: plan_id,
                                           card: stripe_card_token)
        self.stripe_customer_token = customer.id
        save!
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
  
end

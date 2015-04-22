class AddStripeSubscriptionTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_subscription_token, :string
  end
end

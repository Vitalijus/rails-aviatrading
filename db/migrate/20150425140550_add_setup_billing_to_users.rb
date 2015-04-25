class AddSetupBillingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :setup_billing, :boolean, default: false
  end
end

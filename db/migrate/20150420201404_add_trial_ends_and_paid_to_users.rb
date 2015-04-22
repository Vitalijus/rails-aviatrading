class AddTrialEndsAndPaidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :trial_ends, :datetime
    add_column :users, :paid, :boolean
  end
end

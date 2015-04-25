class ChangecolumnTrialEnd < ActiveRecord::Migration
  def change
	rename_column :users, :trial_ends, :trial_end
  end
end

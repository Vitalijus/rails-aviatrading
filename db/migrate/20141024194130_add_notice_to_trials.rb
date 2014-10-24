class AddNoticeToTrials < ActiveRecord::Migration
  def change
    add_column :trials, :notice, :text
  end
end

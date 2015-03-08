class AddAdvertDurationToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :advert_duration, :integer, :default => 0
  end
end

class AddNumberOfPassengersToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :number_of_passengers, :string
  end
end

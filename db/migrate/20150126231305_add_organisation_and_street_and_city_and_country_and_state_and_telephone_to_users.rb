class AddOrganisationAndStreetAndCityAndCountryAndStateAndTelephoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :organisation, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :telephone, :integer
    add_column :users, :state, :string
  end
end

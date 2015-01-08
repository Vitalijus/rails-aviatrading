class AddMakeAndModelAndTypeAndYearAndCurrencyAndPriceAndCountryAndCityToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :make, :string
    add_column :adverts, :model, :string
    add_column :adverts, :type, :string
    add_column :adverts, :year, :integer
    add_column :adverts, :currency, :string
    add_column :adverts, :price, :integer
    add_column :adverts, :country, :string
    add_column :adverts, :city, :string
  end
end

class AddAdobeConnectAndMonAndTueAndWedAndThuAndFriAndSatAndSunToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :adobe_connect, :string
    add_column :courses, :mon, :string
    add_column :courses, :tue, :string
    add_column :courses, :wed, :string
    add_column :courses, :thu, :string
    add_column :courses, :fri, :string
    add_column :courses, :sat, :string
    add_column :courses, :sun, :string
  end
end

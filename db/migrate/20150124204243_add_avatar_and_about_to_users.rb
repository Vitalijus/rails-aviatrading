class AddAvatarAndAboutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :about, :text
  end
end

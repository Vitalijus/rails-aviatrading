class RenameColumnWebsiteUrlName < ActiveRecord::Migration
  def change
  		rename_column :users, :website_url, :web_url
  end
end

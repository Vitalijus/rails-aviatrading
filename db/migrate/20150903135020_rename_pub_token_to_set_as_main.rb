class RenamePubTokenToSetAsMain < ActiveRecord::Migration
  def change
  		rename_column :photos, :public_token, :set_as_main
  end
end

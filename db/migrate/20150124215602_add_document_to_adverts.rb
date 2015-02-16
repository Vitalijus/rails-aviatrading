class AddDocumentToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :document, :string
  end
end

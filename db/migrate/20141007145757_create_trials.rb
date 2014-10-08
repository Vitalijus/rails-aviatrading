class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end

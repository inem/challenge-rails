class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :api_id
      t.references :merchant
      t.string :title
      t.string :url
      t.text :description
      t.timestamp :expires_at
      t.timestamps
    end
  end
end

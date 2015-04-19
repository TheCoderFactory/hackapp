class CreateHackathons < ActiveRecord::Migration
  def change
    create_table :hackathons do |t|
      t.string :name
      t.string :organisation
      t.string :website
      t.datetime :start_date
      t.datetime :end_date
      t.string :location_name
      t.string :street
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :country
      t.integer :total_prize_value
      t.text :description
      t.string :logo
      t.string :registration_link
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

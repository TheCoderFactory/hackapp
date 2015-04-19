class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :first_name
      t.string :email
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end

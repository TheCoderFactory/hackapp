class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :first_name
      t.string :email
      t.string :phone
      t.text :message

      t.timestamps null: false
    end
  end
end

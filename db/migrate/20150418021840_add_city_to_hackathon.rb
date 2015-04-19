class AddCityToHackathon < ActiveRecord::Migration
  def change
    add_column :hackathons, :city, :string
  end
end

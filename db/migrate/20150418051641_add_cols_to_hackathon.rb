class AddColsToHackathon < ActiveRecord::Migration
  def change
    add_column :hackathons, :status, :string
    add_column :hackathons, :latitude, :float
    add_column :hackathons, :longitude, :float
  end
end

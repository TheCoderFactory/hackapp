class Hackathon < ActiveRecord::Base
  belongs_to :user

  validates :name, :city, :website, :start_date, :end_date, :street, :suburb, :state, :postcode, :country, :description, presence: true
  validate :start_date_cannot_be_in_the_past, :end_date_must_be_later_than_start_date
 
 	after_validation :geocode
  geocoded_by :address

  acts_as_taggable
 	# mount_uploader :logo, LogoUploader

 	extend FriendlyId
 	friendly_id :slug_candidates, use: :slugged

  require 'csv'

  def self.import(file, import_user_id)
    CSV.foreach(file.path, headers: true) do |row|

      hackathon_hash = row.to_hash
      unless hackathon_hash["name"] == 'sample hackathon'
        hackathon = Hackathon.create!(hackathon_hash)
        hackathon.update_attributes(user_id: import_user_id)
      end
      
    end 
  end 

 	def slug_candidates
    [
      :name,
      [:name, :city],
      [:name, :city, :country],
      [:name, :city, :country, :get_year],
      [:name, :city, :country, :get_month, :get_year]
    ]
  end

  def get_year
  	self.start_date.year
  end

  def get_month
  	self.start_date.month
  end

  def start_date_cannot_be_in_the_past
    if start_date <= Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end 

  def end_date_must_be_later_than_start_date
  	if end_date <= start_date
  		errors.add(:end_date, "can't be earlier than start date")
  	end
  end

  def self.ordered_by_start_date
  	order(start_date: :asc)
  end

  def self.future_hackathons
  	ordered_by_start_date.where('start_date >= ?', DateTime.now)
  end

  def self.past_hackathons
  	ordered_by_start_date.where('start_date <= ?', DateTime.now)
  end

  def address
    [street, suburb, state, postcode, country].compact.join(', ')
  end

end






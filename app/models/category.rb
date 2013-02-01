class Category < ActiveRecord::Base
	#relationships
	has_many :categorizations
	has_many :offers, :through => :categorizations
	has_many :merchants, :through => :categorizations

	
	#validations
	validates :name, :presence => true, :uniqueness => true
	
	#mass-assignment
	attr_accessible :name, :sort

	#SLUGS
	extend FriendlyId
  friendly_id :name, use: :slugged
end

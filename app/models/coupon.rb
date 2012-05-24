class Coupon < ActiveRecord::Base
  #relationships
  belongs_to :merchant
  has_many :categorizations
  has_many :categories, :through => :categorizations

  #validations
  validates :name,
  	:presence => true,
  	:uniqueness => true
  	
  validates_presence_of :description, :expiration_date
  validates_associated :merchant

  #mass_assignment
  attr_accessible :description, :expiration_date, :name, :printable_file, :merchant_id, :category_ids
  
  #uploaders
  mount_uploader :printable_file, FileUploader
end

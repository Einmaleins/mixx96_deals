class Offer < ActiveRecord::Base
  #relationships
  belongs_to :merchant
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :deals
  has_many :orders, :through => :deals 

  #uploaders
  mount_uploader :image, ImageUploader

  #SLUGS
  extend FriendlyId
  friendly_id :name, use: :slugged
end

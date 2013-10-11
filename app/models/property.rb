class Property < ActiveRecord::Base
  attr_accessible  :title, :description, :dimensions, :price, :address_attributes, :image_attributes, :amenity_list
  belongs_to :user
  has_one :address, as: :addressable, dependent: :destroy
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :image
  before_create :assign_user, :generate_code
  acts_as_taggable_on :amenities
  monetize :price_cents, as: :price
  private
    def assign_user
      self.user = current_user
    end

    def generate_code
      self.code = "PA#{Time.new.to_i + Property.count}"
    end
end

class Property < ActiveRecord::Base
  attr_accessible  :title, :description, :dimensions, :price, :status, :expiry_date, :address_attributes, :image_attributes
  belongs_to :user
  belongs_to :address, dependent: :destroy
  belongs_to :image, dependent: :destroy
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :image
  before_create :assign_user
  acts_as_taggable_on :amenities

  private
    def assign_user
      self.user = current_user
    end
end

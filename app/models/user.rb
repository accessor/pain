class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :properties
  has_one :address, as: :addressable
  has_one :image, as: :imageable
  serialize :roles, Array

  acts_as_taggable_on :iam
  ROLES = %w[admin moderator author banned]

  def roles
  	self[:roles] ||= []
  end

  def is?(role)
  	roles.include?(role.to_s)
  end
end

class Image < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :image
  belongs_to :imageable, polymorphic: true
  has_attached_file :image, :styles => { :medium => "600x600>", :thumb => "300x300>" },
    :default_url => "/images/:style/missing.png"
  # has_attached_file :avatar,
  #     :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  #     :url => "/system/:attachment/:id/:style/:filename"
end

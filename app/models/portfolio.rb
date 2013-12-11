class Portfolio < ActiveRecord::Base
  attr_accessible :description, :title,:user_id,:avatar
  belongs_to :user
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end

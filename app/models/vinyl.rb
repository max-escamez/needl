class Vinyl < ApplicationRecord
  has_many :comments, :dependent => :destroy
  belongs_to :user
  has_one_attached :image
  acts_as_votable

end

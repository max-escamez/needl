class Vinyl < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image
end

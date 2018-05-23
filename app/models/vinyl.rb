class Vinyl < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :album_title, presence: true,
            length: { minimum: 1 }
end

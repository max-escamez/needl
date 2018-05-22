class Vinyl < ApplicationRecord
  validates :album_title, presence: true,
            length: { minimum: 1 }
end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :vinyl
  acts_as_tree order: 'created_at ASC' , dependent: :destroy
end

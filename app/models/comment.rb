class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :vinyl
  acts_as_tree order: 'created_at ASC' , dependent: :destroy

  #belongs_to :parent, class_name: "Comment", foreign_key: :parent_id
  #has_many :replies, class_name: "Comment", foreign_key: :parent_id
end

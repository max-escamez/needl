class Vinyl < ApplicationRecord
  extend OrderAsSpecified
  has_many :comments, :dependent => :destroy
  belongs_to :user
  #attaches an image
  has_one_attached :image
  #permits voting
  acts_as_votable
  #defines filtering methods
  scope :artist_starts_with, -> (artist) { where("artist like ?", "%#{artist}%")}
  scope :album_starts_with, -> (album) { where("album_title like ?", "%#{album}%")}
  scope :search, -> (keyword) { where("(album_title AND artist) like ?", "%#{keyword}%")}
  scope :sort_by_votes, ->  { order("votes DESC")}
  scope :sort_by_dates, ->  { order("created_at DESC")}
  scope :user_submissions, -> (user_id) { where("user_id=?", "#{user_id}").order("created_at DESC")}
  #scope :user_following, -> (user_id) { where("id in (select votable_id from votes where (voter_id=? and vote_flag=1) order by updated_at DESC)", "#{user_id}").order_as_specified("select votable_id from votes where (voter_id=? and vote_flag=1) order by updated_at DESC")}

end

module VoteableCgeb
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable
  end

  def total_votes
    up_votes - down_votes
  end

  def up_votes
    self.votes.select {|vote| vote.vote == true}.size
  end

  def down_votes
    self.votes.select {|vote| vote.vote == false}.size
  end 
end 
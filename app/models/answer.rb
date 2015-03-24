class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes
  validates :description, presence: true
  Answer.order(:cached_weighted_average => :desc)
  acts_as_votable

def up_votes
    self.votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end
  def points
    self.votes.sum(:value).to_i
  end
end

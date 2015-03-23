class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :description, presence: true

end

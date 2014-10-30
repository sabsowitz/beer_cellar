class Cellar < ActiveRecord::Base
  belongs_to :user
  has_many :beers

  validates :user_id, presence: true
end

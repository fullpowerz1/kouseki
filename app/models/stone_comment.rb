class StoneComment < ApplicationRecord

  belongs_to :customer
  belongs_to :ranking
  validates :comment, presence: true

end

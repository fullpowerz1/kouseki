class Ranking < ApplicationRecord
     has_many :ranking_details, dependent: :destroy
     belongs_to :customer
end

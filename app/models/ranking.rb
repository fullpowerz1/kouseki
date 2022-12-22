class Ranking < ApplicationRecord
     has_many :ranking_details, dependent: :destroy
     belongs_to :customer


 enum rank: { rank1: 0, rank2: 1, rank3: 2 }

end

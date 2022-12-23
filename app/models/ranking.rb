class Ranking < ApplicationRecord
     has_many :ranking_details, dependent: :destroy
     belongs_to :customer

    def set_date
      created_at.strftime("%Y/%m/%d %H:%M:%S")
    end

    enum rank: { rank1: 0, rank2: 1, rank3: 2 }

end

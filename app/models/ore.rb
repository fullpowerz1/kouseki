class Ore < ApplicationRecord
    has_many :ranking_details, dependent: :destroyny
end
class Ore < ApplicationRecord
    has_many :ranking_details, dependent: :destroy
    belongs_to :genre
    has_one_attached :image
end
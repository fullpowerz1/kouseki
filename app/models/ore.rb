class Ore < ApplicationRecord
    has_many :ranking_details, dependent: :destroy
    belongs_to :genre
    has_one_attached :image

  def self.looks(search, word)
    if search == "perfect_match"
     @ore = Ore.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
     @ore = Ore.where("name LIKE?", "#{word}%")
    elsif search == "backward_match"
     @ore = Ore.where("name LIKE?", "%#{word}")
    elsif search == "partical_match"
     @ore = Ore.where("name LIKE?", "%#{word}%")
    else
     @ore = Ore.all
    end
  end
end
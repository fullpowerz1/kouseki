class Ore < ApplicationRecord
    has_many :rankings, dependent: :destroy
    has_many :tagmaps, dependent: :destroy
    has_many :tags, through: :tagmaps
    belongs_to :genre
    has_one_attached :image

  # ジャンル検索のメソッド
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

  # ↓ここからタグ検索用のメソッド
  def self.ores_search(search)
   Ore.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
  end

  def save_ores(tags)
   current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
   old_tags = current_tags - tags
   new_tags = tags - current_tags
  end

    end
  end
end
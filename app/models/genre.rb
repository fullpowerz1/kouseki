class Genre < ApplicationRecord
    has_many :ores, dependent: :destroy

    # ジャンル検索が機能していないので、調べる。
    def self.looks(search, word)
      if search == "perfect_match"
        @genre = Genre.where("name LIKE?", "#{word}")
      elsif search == "forward_match"
        @genre = Genre.where("name LIKE?", "#{word}%")
      elsif search == "backward_match"
        @genre = Genre.where("name LIKE?", "%#{word}")
      elsif search == "partical_match"
        @genre = Genre.where("name LIKE?", "%#{word}%")
      else
        @genre = Genre.all
      end
    end
end

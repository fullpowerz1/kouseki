class Ranking < ApplicationRecord

     belongs_to :customer
     belongs_to :ore
     has_many :stone_comments, dependent: :destroy
     has_many :favorites, dependent: :destroy

    def set_date
      created_at.strftime("%Y/%m/%d %H:%M:%S")
    end

    # バリデーションを後々入れる

    # favoritesテーブル内に存在するか調べるメソッド
    def favorited_by?(customer)
      favorites.exists?(customer_id: customer.id)
    end

    def full_name
    self.first_name + self.last_name
    end

    enum status: { silver: 0, bronze: 1, gold: 2 }
    enum rank: { rank1: 0, rank2: 1, rank3: 2 }

end

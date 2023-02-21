class Decoration < ApplicationRecord
     belongs_to :customer

     # バリデーション
     validates :ore, presence: true, length: { minimum: 3 }
     validates :amulet, presence: true
     validates :nickname, presence: true, uniqueness: true, length: { minimum: 3 }
end

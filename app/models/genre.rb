class Genre < ApplicationRecord
    has_many :ores, dependent: :destroy
end

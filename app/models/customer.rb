class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :rankings, dependent: :destroy
    has_many :decorations, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  #名前をフルネームで記述できるように
  def full_name
    self.last_name + "" + self.first_name
  end

  #名前かなをフルネームで記述できるように
  def full_name_kana
    last_name_kana + first_name_kana
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "user"
      customer.first_name = "guest"
      customer.last_name_kana = "taiki"
      customer.first_name_kana = "sonoyama"
      customer.postal_code = "338"
      customer.address = "saitama"
      customer.telephone_number = "048"
    end
  end
end

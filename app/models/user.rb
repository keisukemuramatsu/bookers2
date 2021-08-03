class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :books, dependent: :destroy       
  validates :name, uniqueness: true
  validates :name, presence: true #追記
  validates :introduction, length: { maximum: 50 } #追記
end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :collections, dependent: :destroy

  has_one :balance, dependent: :destroy

  # validates :name, presence: true, uniqueness: true

end

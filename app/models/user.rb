class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true
  has_one :pet, dependent: :destroy
  has_friendship

end

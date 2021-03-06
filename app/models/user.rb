class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true
  has_one :pet, dependent: :destroy
  has_one :favourite_place, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_friendship

  def friends?
    self.friends
end

def friend_requests?
    self.requested_friends.any?
end

def requested_friends?
    self.pending_friends.any?
end

def invite_friend(user)
    self.friend_request(user)
end

def not_friends
    potential = []
    User.all.each do |user|
        if (self.friends_with?(user) != true && self != user && self.friends.include?(user) != true && self.pending_friends.include?(user) != true && self.requested_friends.include?(user) != true)
            potential << user
        end
    end
    potential
end



end

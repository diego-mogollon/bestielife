class Chatroom < ApplicationRecord
    has_many :messages
    has_one_attached :photo
end

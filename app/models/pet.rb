class Pet < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :events, dependent: :destroy
  has_many :budgets, dependent: :destroy
  has_many :expenses, dependent: :destroy
end

class Budget < ApplicationRecord
  belongs_to :pet
  belongs_to :expense_type
  validates :month, presence: true
  validates :amount, presence: true
end

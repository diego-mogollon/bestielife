class Expense < ApplicationRecord
    belongs_to :pet
    belongs_to :expense_type
    validates :description, presence: true
end
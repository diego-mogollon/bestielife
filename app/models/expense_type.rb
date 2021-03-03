class ExpenseType < ApplicationRecord
    has_many :budgets, dependent: :destroy
    has_many :expenses, dependent: :destroy
end

class Budget < ApplicationRecord
  belongs_to :pet
  belongs_to :expense_type
end

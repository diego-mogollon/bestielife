class ExpenseTypesController < ApplicationController
    def index
        @expense_types = ExpenseType.all
    end
end

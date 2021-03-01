class ExpensesController < ApplicationController
    before_action :find_expense_type
    before_action :find_expense, only: [:show, :edit, :update, :destroy]

    def index
        @expenses = @expense_type.expenses
    end

    def show

    end

    def new
        @expense = Expense.new
    end

    def create
        @expense = Expense.new(expense_params)
        @expense.pet = current_user.pet
        @expense.expense_type = @expense_type
        if @expense.save
            @expense_type.save
            redirect_to expense_type_expenses_path
        else
            render :new
        end
    end

    def edit

    end

    def update       
        @expense.expense_type = @expense_type
        @expense.pet = current_user.pet
        if @expense.update(expense_params)
            redirect_to expense_type_expenses_path
        else
            render :edit
        end
    end

    def destroy
        @expense.destroy
        flash[:notice] = "Expense successfully deleted"
        redirect_to expense_type_expenses_path
    end
    private

    def find_expense_type
        @expense_type = ExpenseType.find(params[:expense_type_id])
    end

    def find_expense
        @expense = @expense_type.expenses.find(params[:id])
    end

    def expense_params
        params.require(:expense).permit(:amount, :date, :description)
    end
end

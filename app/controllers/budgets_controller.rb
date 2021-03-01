class BudgetsController < ApplicationController
    before_action :find_expense_type
    before_action :find_budget, only: [:show, :edit, :update, :destroy]

    def index
        @budgets = @expense_type.budgets
    end

    # def show

    # end

    def new
        @budget = Budget.new
    end

    def create
        @budget = Budget.new(budget_params)
        @budget.pet = current_user.pet
        @budget.expense_type = @expense_type
        if @budget.save
            flash[:notice] = "Budget added successfully"
            redirect_to expense_type_budgets_path
        else
            flash[:alert] = "Budget could not be added. Please try again"
            render :new
        end
    end

    def edit

    end

    def update       
        @budget.expense_type = @expense_type
        @budget.pet = current_user.pet
        if @budget.update(budget_params)
            flash[:notice] = "Budget updated successfully"
            redirect_to expense_type_budgets_path
        else
            flash[:alert] = "Budget could not be updated. Please try again"
            render :edit
        end
    end

    def destroy
        @budget.destroy
        flash[:notice] = "Budget successfully deleted"
        redirect_to expense_type_budgets_path
    end 

    private

    def find_expense_type
        @expense_type = ExpenseType.find(params[:expense_type_id])
    end

    def find_budget
        @budget = @expense_type.budgets.find(params[:id])
    end

    def budget_params
        params.require(:budget).permit(:amount, :month)
    end
end

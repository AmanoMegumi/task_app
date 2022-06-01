class PlansController < ApplicationController
    def index
        @plans = Plan.all
    end

    def new
        @plan = Plan.new
    end

    def create
        @plan = Plan.new(params.require(:plan).permit(:title, :start, :finish, :checkbox, :comment))
        if @plan.save
            redirect_to :plans
        else
            flash[:failure] = "スケジュールを登録できませんでした"
            render "new"
        end
    end

    def show
        @plan = Plan.find(params[:id])
    end

    def edit
        @plan = Plan.find(params[:id])
    end

    def update
        @plan = Plan.find(params[:id])
        if @plan.update(params.require(:plan).permit(:title, :start, :finish, :checkbox, :comment))
            flash[:success] = "スケジュールを更新しました"
            redirect_to :plans
        else
            flash[:failure] = "スケジュールを更新できませんでした"
            render "edit"
        end
    end

    def destroy
        @plan = Plan.find(params[:id])
        @plan.destroy
        flash[:notice] = "スケジュールを削除しました"
        redirect_to :plans
    end
end

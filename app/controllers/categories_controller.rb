class CategoriesController < ApplicationController
    before_action :user_signed_in?
    before_action :find_category, only: [:show, :update, :edit, :destroy]

    def index
        if current_user.present?
            @categories = Category.all
        else
            redirect_to new_user_session_path
        end
    end

    def show
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            redirect_to @category
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @category.update(category_params)
            redirect_to @category
        else
            render 'edit'
        end
    end

    def destroy
        @category.destroy

        redirect_to root_path
    end

    private
    def category_params
        params.require(:category).permit(:name, :details)
    end

    def find_category
        @category = Category.find(params[:id])
    end
end
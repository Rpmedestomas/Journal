class CategoriesController < ApplicationController
    before_action :user_signed_in?

    def index
        if current_user.present?
            @categories = current_user.categories
        else
            redirect_to new_user_session_path
        end
    end

    def show
        @category = Category.find(params[:id])
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
        @category = Category.find(params[:id])
    end

    def update
        if @category.update(category_params)
            redirect_to @category
        else
            render 'edit'
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy

        redirect_to root_path
    end

    private
    def category_params
        params.require(:category).permit(:name, :details, :user_id)
    end
end
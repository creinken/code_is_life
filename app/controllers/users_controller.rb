class UsersController < ApplicationController
    before_action :get_user, only: :show

    def index
        @users = User.all
    end

    def show
        # binding.pry
        @projects = @user.projects
    end

    def show_commented
        # binding.pry
        @user = User.find_by(id: params[:user_id])
        @projects = @user.projects.ruby
        render :show
    end

    private

    def get_user
        @user = User.find_by(id: params[:id])
    end
end

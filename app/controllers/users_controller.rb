class UsersController < ApplicationController
    before_action :get_user, only: :show

    def index
        @users = User.all
    end

    def show
        @projects = @user.projects
    end
    

    private

    def get_user
        @user = User.find_by(id: params[:id])
    end
end

class UsersController < ApplicationController
    before_action :get_user, only: :show

    def index
        binding.pry
        @users = User.all
    end

    def show
    end

    private

    def get_user
        @user = User.find_by(id: params[:id])
    end
end

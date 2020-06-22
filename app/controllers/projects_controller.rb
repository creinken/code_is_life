class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        if params[:user_id]
            @projects = User.find(params[:user_id]).posts
        else
            @projects = Project.all
        end
    end

    def new
        # binding.pry
        @user = User.find_by(id: params[:user_id])
        @project = Project.new(user_id: params[:user_id])
    end

    def create
        @user = User.find_by(id: params[:project][:user_id])
        if !params[:project][:name].empty? && !params[:project][:language].empty? && !params[:project][:url].empty?
            @project = @user.projects.build(new_project_params(:user_id, :name, :language, :description, :url))
        end

        if @project.save
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update
        @project.update(update_project_params)
        redirect_to project_path(@project)
    end

    def destroy
        @project.destroy
        redirect_to user_path(current_user)
    end

    private

    def set_project
        # binding.pry
        @project = Project.find_by(id: params[:id])
    end

    def new_project_params(*args)
        params.require(:project).permit(*args)
    end

    def update_project_params
        params.require(:project).permit(:name,
                                        :url,
                                        :language,
                                        :description)
    end
end

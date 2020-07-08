class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        if params[:user_id]
            @projects = User.find(params[:user_id]).projects
        else
            @projects = Project.all
        end
    end

    def new
        @user = User.find_by(id: params[:user_id])
        @project = Project.new(user_id: params[:user_id])
    end

    def create
        @user = User.find_by(id: params[:project][:user_id])
        @project = @user.projects.build(new_project_params(:user_id, :name, :language, :description, :url))
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
        if @project.update(update_project_params)
            redirect_to project_path(@project)
        else
            render :edit
        end
    end

    def destroy
        @project.destroy
        redirect_to user_path(current_user)
    end

    private

    def set_project
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            if user.nil?
                redirect_to users_path, alert: "User not found."
            else
                @project = user.projects.find_by(id: params[:id])
                redirect_to user_projects_path(user), alert: "Project not found." if @project.nil?
            end
        else
            @project = Project.find(params[:id])
        end
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

class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :delete]

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @user = User.find_by(id: params[:project][:user_id])
        @project = @user.projects.build(new_project_params)

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

    def delete
        @project.destroy
        redirect_to projects_path
    end

    private

    def set_project
        @project = Project.find_by(id: params[:id])
    end

    def new_project_params
        params.require(:project).permit(:name,
                                        :url,
                                        :language,
                                        :description,
                                        :user_id)
    end

    def update_project_params
        params.require(:project).permit(:name,
                                        :url,
                                        :language,
                                        :description)
    end
end

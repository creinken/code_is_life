class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = Project.all
    end

    def show_lang
        # binding.pry
        projects_array = Project.get_lang(params[:project][:language])
        @projects = Project.relate_to_record(projects_array)
        render 'projects/index.html.erb'
    end

    def new
        @project = Project.new(user_id: current_user)
    end

    def create
        @project = current_user.projects.build(new_project_params(:user_id, :name, :language, :description, :url))
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
        @project = Project.find_by(id: params[:id])
        redirect_to projects_path, alert: "Project not found." if @project.nil?
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

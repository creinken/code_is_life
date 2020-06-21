class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = Project.all
    end

    def new
        if current_user.provider == "github"
            @project = Project.new
            @github_projects = []
            @github_projects = current_user.get_projects_from_github.collect {|proj|   {name: proj["name"],
                                                                                        url: proj["html_url"],
                                                                                        description: proj["description"],
                                                                                        language: proj["language"],
                                                                                        github_id: proj["id"]}
                                                                                    }
            render :new_with_github
        else
            @project = Project.new
            render :new
        end
    end

    def create
        binding.pry
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

module ProjectsHelper
    def edit_project(proj)
        if proj.user_id == current_user.id
            link_to('Edit', edit_project_path(proj))
        end
    end
end

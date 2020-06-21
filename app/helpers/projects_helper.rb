module ProjectsHelper
    def edit_or_show_project(proj)
        if proj.user_id == current_user.id
            link_to('Edit', edit_project_path(proj))
        else
            link_to('View', project_path(proj))
        end
    end
end

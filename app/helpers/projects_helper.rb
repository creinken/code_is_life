module ProjectsHelper
    def edit_project(proj)
        if user_signed_in?
            if proj.user_id == current_user.id
                link_to('Edit', edit_project_path(proj))
            end
        end
    end
end

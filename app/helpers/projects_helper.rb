module ProjectsHelper
    def edit_project(proj)
        if user_signed_in?
            if proj.user_id == current_user.id
                link_to('Edit', edit_project_path(proj))
            end
        end
    end

    def deleteable?(proj)
        if current_user == proj.user
            button_to("Delete", project_path(proj), method: :delete)
        end
    end
end

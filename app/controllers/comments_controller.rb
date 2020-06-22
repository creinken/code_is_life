class CommentsController < ApplicationController

    def create
        binding.pry
        @commenter = Commenter.find_by(id: params[:comment][:commenter_id])
        @project = Project.find_by(id: params[:comment][:project_id])
        if !params[:comment][:content].empty?
            @commenter.comments.create(comment_params)
        end
        redirect_to project_path(@project)
    end

    def destroy

    end

    private

    def comment_params
        params.require(:comment).permit(:commenter_id, :content, :project_id)
    end
end

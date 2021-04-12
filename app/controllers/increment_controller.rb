class IncrementController < ApplicationController

    # before_action :authenticate_user!, only: %i[increment_votes]
    def increment_votes
        if user_signed_in?
            a = request.params[:id]

            vote_type = request.params[:format]

            @answer = Answer.find(a)
            
            if vote_type == 'up_vote'
                @answer.increment!(:up_vote)
            elsif vote_type == 'down_vote'
                @answer.increment!(:down_vote)
            end
            redirect_to controller: 'questions', action: 'show', id: @answer.question_id
        else
            flash[:alert] = "Please Sign In..."
            redirect_to new_user_session_path
        end
    end
end

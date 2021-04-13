class IncrementController < ApplicationController
    # before_action :authenticate_user!, only: %i[increment_votes]
    def increment_votes
        if user_signed_in?
            a = request.params[:id]

            vote_type = request.params[:format]

            @answer = Answer.find(a)
            @v = Validvote.where({user_id: current_user.id, answer_id: @answer.id})
            
            if @v.inspect.length <= 28

                @voted = Validvote.new({:user_id => current_user.id, :answer_id => @answer.id, :isVoted => true})
                @voted.save    
                if vote_type == 'up_vote'
                    @answer.increment!(:up_vote)
                elsif vote_type == 'down_vote'
                    @answer.increment!(:down_vote)
                end
            else
                flash[:alert] = "Already voted"
            end
            redirect_to controller: 'questions', action: 'show', id: @answer.question_id
        else
            flash[:alert] = "Please Sign in to vote."
            redirect_to new_user_session_path
        end
    end
end

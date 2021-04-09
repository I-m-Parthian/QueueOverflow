class IncrementController < ApplicationController
    def increment_votes
        a = request.params[:id]

        vote_type = request.params[:format]

        @answer = Answer.find(a)
        
        if vote_type == 'up_vote'
            @answer.increment!(:up_vote)
        elsif vote_type == 'down_vote'
            @answer.increment!(:down_vote)
        end
        redirect_to answers_path(@answer)
    end
end

class Api::V1::VotesController < ApplicationController
    before_action :find_votable_object, only: [:create]
    
    def create
        if !already_voted?
            @votable_object.votes.create(user_id: current_user.id)
            render json: render_object(@votable_object)
           
        else
            render json: {message: 'you have already upvoted this post'}
        end
       
    end

    def destroy
        @vote = Vote.find_by(id: params[:id])
        if @vote
            @vote.destroy
        end
        
    end
    
    private
   
    def find_votable_object
        @votable_object = Question.find_by(id: params[:question_id]) || Answer.find_by(id: params[:answer_id])
        render json: {error: 'unable to vote'} unless @votable_object
    end
    def already_voted?
        Vote.where(user_id: current_user.id, votable: @votable_object).exists?
    end
    
    
    def render_object(object)
        if object.class == Question
           { question: QuestionSerializer.new(object) }
        else
           { answer: AnswerSerializer.new(object) }
        end 
    end
    
    
end

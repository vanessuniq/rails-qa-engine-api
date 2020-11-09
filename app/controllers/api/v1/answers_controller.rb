class Api::V1::AnswersController < ApplicationController
  before_action :find_answer, only: [:update, :destroy]
  skip_before_action :require_login, only: [:index]
  
  def index
    answers = Answer.all
    render json: answers, status: :ok
  end

  def create
    answer = Answer.new(answer_params)
    if answer.save
      render json: { answer: AnswerSerializer.new(answer) }, status: :created
    else
      render json: {errors: answer.errors.full_messages}, status: :not_acceptable 
    end
  end

  def update
    if @answer.update(answer_params)
      render json: { answer: AnswerSerializer.new(@answer) }
    else
      render json: {error: @answer.errors.full_messages.first}, status: :not_acceptable 
    end
  end

  def destroy
    @answer.destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :body, :question_id)
  end

  def find_answer
    @answer = Answer.find_by(id: params[:id])
    render json: {error: 'Answer not found'} unless @answer
  end
  

end

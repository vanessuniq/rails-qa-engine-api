class Api::V1::QuestionsController < ApplicationController
  before_action :find_question, only: [:update, :destroy]
  skip_before_action :require_login, only: [:index]

  def index
    questions = Question.order(created_at: :DESC)
    render json: questions, status: :ok
  end

  def create
    question = Question.new(question_params)
    if question.save
      render json: {question: QuestionSerializer.new(question)}, status: :created
    else
      render json: {errors: question.errors.full_messages}, status: :not_acceptable 
    end
  end

  def update
    if @question.update(question_params)
      render json: { question: QuestionSerializer.new(@question) }
    else
      render json: {error: @question.errors.full_messages.first}, status: :not_acceptable 
    end
  end

  def destroy
    if @question
      @question.destroy
    else
      render json: {error: 'Unable to delete question, please try again'}, status: :unauthorized
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :topic, :user_id)
  end

  def find_question
    @question = Question.find_by(id: params[:id])
    render json: {error: 'Question not found'} unless @question
  end
  
end

class Api::V1::QuestionsController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    questions = Question.all
    render json: {questions: QuestionSerializer.new(questions)}, status: :ok
  end

  def create
    question = Question.new(question_params)
    if question.save
      render json: {question: QuestionSerializer.new(question)}, status: :created
    else
      render json: {errors: question.errors.full_messages}, status: :not_acceptable 
    end
  end

  def destroy
    question = Question.find_by(id: params[:id])
    if question
      question.destroy
    else
      render json: {error: 'Unable to delete question, please try again'}, status: :unauthorized
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :topic, :user_id)
  end
  
end

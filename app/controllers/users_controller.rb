class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = Users.all('level desc')
  end

  def play
    @level = current_user.level
    unless @level == Question.last.id.to_i
      redirect_to "/questions/#{@level + 1}"
    else
      redirect_to "/congratulations"
    end
  end

  def answer_submit
    # byebug
    @question = Question.find(params[:question_id])
    answer = params[:answer]
    @answer_count = current_user.answer_count
    @level = current_user.level
      if answer == @question.answer
        @answer_count = 0
        @level += 1
        current_user.update_attribute(:level, @level)
        current_user.update_attribute(:answer_count, @answer_count)
        unless @question == Question.last
          redirect_to url_for(action: "play")
        else
          redirect_to "/congratulations"
        end
      else
        @answer_count += 1
        current_user.update_attribute(:answer_count, @answer_count)
      end

  end

  private
    def user_params
      params.permit(:answer)
    end
end

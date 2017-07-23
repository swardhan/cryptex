class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all.order('level desc, submit_time desc')
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
    @correct=false
      if answer == @question.answer
        @answer_count = 0
        @level += 1
        current_user.update_attribute(:level, @level)
        current_user.update_attribute(:answer_count, @answer_count)
        current_user.update_attribute(:submit_time, Time.now)
        @correct = true
        # unless @question == Question.last
        #   redirect_to url_for(action: "play")
        # else
        #   redirect_to "/congratulations"
        # end
      else
        @correct = false
        @answer_count += 1
        current_user.update_attribute(:answer_count, @answer_count)
      end
      
      respond_to do |format|
        format.js {}
      end

  end

  private
    def user_params
      params.permit(:answer)
    end
end

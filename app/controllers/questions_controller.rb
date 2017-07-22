class QuestionsController < InheritedResources::Base

  before_action :authenticate_user!

  def congratulations
    @user = current_user
    unless Question.last.id.to_i == @user.level
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end

  private

    def question_params
      params.require(:question).permit(:image, :description, :answer, :level)
    end
end

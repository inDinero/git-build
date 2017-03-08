class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @users.map { |user| UserPresenter.new(user: user).to_h }, status: :ok }
    end
  end
end

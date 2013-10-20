class UsersController < ApplicationController

  before_filter :validate_editor, only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'Your information was successfully saved.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def validate_editor
    if params[:id].to_i != @user.id
      render text: "You can only edit your own account.", status: 401
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :dismissed_welcome_message, :digest_subscriber, :digest_frequency)
  end
end

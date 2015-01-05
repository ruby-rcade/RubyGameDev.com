class UsersController < Clearance::UsersController

  # all actions in this controller are scoped to the current_user
  before_action :validate_editor, only: [:edit, :update]

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: 'users/new'
    end
  end

  def edit_current_user
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to params[:redirect_to] || account_path, notice: 'Your information was successfully saved.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def validate_editor
    if params[:id].to_i != current_user.id
      render text: "You can only edit your own account.", status: 401
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :dismissed_welcome_message, :digest_subscriber, :digest_frequency)
  end
end

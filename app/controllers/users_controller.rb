class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: "Bienvenue !"
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(edit_user_params)
      redirect_to dashboard_path, notice: "Profil mis à jour avec succès."
    else
      flash.now[:alert] = "Erreur lors de la mise à jour du profil."
      render :edit
    end
  end

  private

  def edit_user_params
    params.require(:user).permit(:height, :weight)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end

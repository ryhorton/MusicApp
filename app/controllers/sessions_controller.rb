class SessionsController < ApplicationController


  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["Incorrect email and/or password!"]
      render :new
    else
      login_user!(user)
      redirect_to user_url(user)   # User#show page
    end
  end


  def destroy
    logout_user!
    redirect_to new_session_url
  end


  def new
    @user = User.new

    render :new
  end

end

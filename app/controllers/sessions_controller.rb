class SessionsController < ApplicationController

=begin
Sessions controller handles Sign-in/Sign-out

CREATE will be executed when user submits form in sessions/new.html.erb
(a)Check if valid email and password digest in DB pass the user to user.
    - authenticate method is called on User class, defined in user model
(b)For authenticated user, create user session key

 DESTROY will be executed when user logout
 (a)Session key will be destroyed upon signout
=end

  def create

    user = User.find_by(email: params[:post][:email]).try(:authenticate, params[:post][:password])

    if user.nil?
      flash.now.alert = "Invalid email/password combination"
      render new
    else
      session[:user_id] = user.id     #If matches, put the user_id into a session
      redirect_to pages_home_path , :notice => "Logged in!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
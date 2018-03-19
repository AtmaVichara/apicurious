class SessionsController < ApplicationController

  def create
    binding.pry
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to profile_index_path
  end

end

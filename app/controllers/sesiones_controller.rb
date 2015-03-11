class SesionesController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @usuario = Usuario.new
  end

  def create
    if @usuario = login(params[:email], params[:password])
      redirect_back_or_to(@usuario, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(login_path, notice: 'Logged out!')
  end
end

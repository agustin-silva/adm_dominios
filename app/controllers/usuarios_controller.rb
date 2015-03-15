class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy, :notificar]
  skip_before_filter :require_login, only: [:index, :new, :create]

  def index
    @usuarios = Usuario.all
  end

  def show
    @dominios = current_user.dominios
  end

  def new
    @usuario = Usuario.new
  end

  def edit
  end

  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      redirect_to @usuario, notice: 'Usuario creado con éxito!'        
    else
      render :new
    end
  end

  def update    
    if @usuario.update(usuario_params)
      redirect_to @usuario, notice: 'Usuario actualizado con éxito!'
    else
      render :edit
    end    
  end

  def destroy
    @usuario.destroy
    redirect_to usuarios_url, notice: 'Usuario destruido con éxito!'
  end

  def notificar
    UsuarioMailer.dominios_por_vencer(@usuario).deliver
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:email, :password, :password_confirmation)
    end
end

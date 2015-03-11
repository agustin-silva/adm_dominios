class DominiosController < ApplicationController
  before_action :set_dominio, only: [:show, :edit, :update, :destroy]

  def new
    @dominio = Dominio.new
  end

  def create
    @dominio = Dominio.new(dominio_params)
    @dominio.usuario = current_user

    if @dominio.save
      redirect_to current_user, notice: 'Dominio registrado con éxito!'
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @dominio.update_attributes(dominio_params)
      redirect_to current_user, notice: 'Dominio actualizado con éxito!'
    else
      render 'edit'
    end
  end

  def destroy
    @dominio.destroy
    redirect_to current_user, notice: 'Dominio eliminado!'
  end

  private
    def set_dominio
      @dominio = Dominio.find(params[:id])
    end

    def dominio_params
      params.require(:dominio).permit(:nombre, :fecha_de_alta, :vencimiento)
    end
end

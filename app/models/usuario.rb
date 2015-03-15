class Usuario < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  has_many :dominios

  def debe_renovar_dominios?
  	self.dominios.dominios_por_vencer.empty? ? false : true
  end

  private

  # necesito pasar de parametro al usuario! Consultar a los chicos
  def notificar_usuario
  	UsuarioMailer.dominios_por_vencer.deliver
  end  
end

class UsuarioMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usuario_mailer.notificar_usuario.subject
  #

  default from: "admin@adm_dominios.com"

  def notificar_usuario(usuario)
    @usuario = usuario
    @dominios_a_vencer = usuario.dominios.dominios_por_vencer

    mail to: @usuario.email, subject: 'Dominios por vencer'
  end
end

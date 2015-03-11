# Preview all emails at http://localhost:3000/rails/mailers/usuario_mailer
class UsuarioMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/usuario_mailer/notificar_usuario
  def notificar_usuario
    UsuarioMailer.notificar_usuario
  end

end

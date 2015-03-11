require 'test_helper'

class UsuarioMailerTest < ActionMailer::TestCase
  test "notificar_usuario" do
    mail = UsuarioMailer.notificar_usuario
    assert_equal "Notificar usuario", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

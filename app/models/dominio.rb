class Dominio < ActiveRecord::Base
  validates :nombre, uniqueness: true, presence: true

  validates :fecha_de_alta, presence: true
  validates :vencimiento, presence: true

  belongs_to :usuario

  scope :dominios_por_vencer, -> { where(:vencimiento => Date.today..(Date.today + 30.days)) }

  def hay_que_renovar?
    (self.vencimiento - Date.today).to_i < 30 ? true : false
  end

  def esta_vencido?
    self.vencimiento < Date.today ? true : false
  end

  def dias_restantes
    (self.vencimiento - Date.today).to_i
  end
end

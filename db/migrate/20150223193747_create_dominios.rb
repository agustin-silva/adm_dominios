class CreateDominios < ActiveRecord::Migration
  def change
    create_table :dominios do |t|
      t.string :nombre
      t.date :fecha_de_alta
      t.date :vencimiento

      t.belongs_to :usuario, index: true

      t.timestamps null: false
    end
  end
end

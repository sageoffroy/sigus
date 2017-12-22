class CreateOfficeHourDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :office_hour_details do |t|
      t.references :office_hour, foreign_key: true
      t.references :agent, foreign_key: true
      t.string :turno_hora
      t.integer :lunes
      t.integer :martes
      t.integer :miercoles
      t.integer :jueves
      t.integer :viernes
      t.integer :sabado
      t.integer :domingo
      t.integer :total_hours

      t.timestamps
    end
  end
end

class CreateAdditionalDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :additional_details do |t|
      t.references :agent, foreign_key: true
      t.references :additional, foreign_key: true
      t.references :rotative_turn, foreign_key: true
      t.boolean :franco_movil
      t.boolean :turno_nocturno_fijo
      t.boolean :tarea_en_terreno
      
      t.timestamps
    end
  end
end

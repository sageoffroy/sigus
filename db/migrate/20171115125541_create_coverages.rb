class CreateCoverages < ActiveRecord::Migration[5.1]
  def change
    create_table :coverages do |t|
      t.references :service_of_dependence, foreign_key: true
      t.integer :hs_lunes_diurnas
      t.integer :hs_lunes_nocturnas
      t.integer :hs_martes_diurnas
      t.integer :hs_martes_nocturnas
      t.integer :hs_miercoles_diurnas
      t.integer :hs_miercoles_nocturnas
      t.integer :hs_jueves_diurnas
      t.integer :hs_jueves_nocturnas
      t.integer :hs_viernes_diurnas
      t.integer :hs_viernes_nocturnas
      t.integer :hs_sabado
      t.integer :hs_domingo

      t.timestamps
    end
  end
end

class CreateAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :agents do |t|
      t.integer :dni, foreign_key: true
      t.string :fullname
      t.string :sex
      t.date :birthdate
      t.string :marital_status
      t.references :nationality
      t.string :email
      t.string :cell_phone
      t.references :position
      t.references :hour_regime
      t.references :study
      t.references :job_function
      t.references :agent_type
      t.boolean :exclusive_dedication       #Dedicación Exclusiva
      t.boolean :functional_dedication      #Dedicación Funcional
      t.boolean :unhealthy_work             #Trabajo Insalubre
      t.boolean :rural_functional_dedication #Dedicacion Funcional Rural


      t.timestamps
    end
  end
end

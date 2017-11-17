class CreateServiceOfDependences < ActiveRecord::Migration[5.1]
  def change
    create_table :service_of_dependences do |t|
      t.references :service, foreign_key: true
      t.references :dependence, foreign_key: true
      t.string :description
      t.boolean :con_guardia
      t.float :jefatura
      t.float :asistencial
      t.float :ausentismo

      t.timestamps
    end
  end
end

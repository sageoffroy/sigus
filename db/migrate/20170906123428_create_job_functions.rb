class CreateJobFunctions < ActiveRecord::Migration[5.1]
  def change
    create_table :job_functions do |t|
      t.string :name
      t.string :observation

      t.timestamps
    end
  end
end

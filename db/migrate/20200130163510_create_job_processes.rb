class CreateJobProcesses < ActiveRecord::Migration
  def change
    create_table :job_processes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :job_id
      t.integer :global_process_id
      t.integer :order

      t.timestamps null: false
    end
  end
end

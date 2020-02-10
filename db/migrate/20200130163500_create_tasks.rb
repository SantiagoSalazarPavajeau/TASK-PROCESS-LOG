class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.integer :job_id
      t.integer :global_process_id
      t.integer :order
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

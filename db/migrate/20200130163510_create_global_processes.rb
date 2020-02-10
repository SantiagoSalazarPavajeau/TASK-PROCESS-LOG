class CreateGlobalProcesses < ActiveRecord::Migration
  def change
    create_table :global_processes do |t|
      t.string :name
      t.integer :user_id


      t.timestamps null: false
    end
  end
end

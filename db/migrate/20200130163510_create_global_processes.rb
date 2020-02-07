class CreateGlobalProcesses < ActiveRecord::Migration
  def change
    create_table :global_processes do |t|
      t.string :name
      

      t.timestamps null: false
    end
  end
end

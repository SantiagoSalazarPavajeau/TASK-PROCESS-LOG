class CreateProcesses < ActiveRecord::Migration
  def change
    create_table :processes do |t|

      t.timestamps null: false
    end
  end
end

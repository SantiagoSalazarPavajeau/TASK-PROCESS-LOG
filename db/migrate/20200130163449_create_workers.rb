class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.string :job
      t.string :email
      t.string :password_digest
      t.timestamps null: false
    end
  end
end

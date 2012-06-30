class CreateTasks < ActiveRecord::Migration
  def up
    create_table(:tasks) do |t|
      t.string :content
      t.date :due_date
      t.boolean :important, :default => false
      t.boolean :complete, :default => false
    end
  end

  def down
    drop_table :tasks
  end
end

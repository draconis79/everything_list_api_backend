class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :task
      t.integer :task_id
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end

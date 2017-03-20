class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :description
      t.string :budget
      t.string :title
      t.string :deadline

      t.timestamps null: false
    end
  end
end

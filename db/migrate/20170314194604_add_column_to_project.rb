class AddColumnToProject < ActiveRecord::Migration
  def change
  	add_column :projects, :poster_id, :integer
  	add_column :projects, :employee_id, :integer
  	add_column :projects, :finisher_id, :integer
  end
end

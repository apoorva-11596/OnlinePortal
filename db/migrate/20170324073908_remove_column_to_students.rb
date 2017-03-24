class RemoveColumnToStudents < ActiveRecord::Migration
  def change
  	remove_column :students, :sid
  	remove_column :students, :fid
  end
end

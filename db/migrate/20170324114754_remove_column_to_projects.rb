class RemoveColumnToProjects < ActiveRecord::Migration
  def change
  	remove_column :projects, :sid
  	remove_column :projects, :fid
  end
end

class AddcolumntoProject < ActiveRecord::Migration
  def change
  	add_column :projects, :sid, :integer
  	add_column :projects, :fid, :integer
  end
end

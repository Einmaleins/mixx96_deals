class AddColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :age_verify, :boolean, :default => false
  end
end

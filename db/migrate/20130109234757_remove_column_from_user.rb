class RemoveColumnFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :age_verify
  end
end

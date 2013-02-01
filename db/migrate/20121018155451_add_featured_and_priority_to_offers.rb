class AddFeaturedAndPriorityToOffers < ActiveRecord::Migration
  def change
  	add_column :offers, :featured, :boolean, :default => false
    add_column :offers, :priority, :integer, :default => 0
  end
end

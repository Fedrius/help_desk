class AddTierToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :tier, :text
  end
end

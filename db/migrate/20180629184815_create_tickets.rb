class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :type
      t.string :priority
      t.string :status
      t.timestamps
    end
  end
end

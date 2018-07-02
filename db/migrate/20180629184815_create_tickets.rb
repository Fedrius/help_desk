class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :type
      t.string :priority, default: 'low'
      t.string :status, default: 'open'
      t.timestamps
    end
  end
end

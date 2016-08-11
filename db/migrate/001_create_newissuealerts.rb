class CreateNewissuealerts < ActiveRecord::Migration
  def change
    create_table :newissuealerts do |t|
      t.integer :project_id
      t.string :mail_addresses
      t.boolean :enabled, :default => 0
      t.boolean :priority, :default => 0
    end
  end
end

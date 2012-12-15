class AddCompletedAtIntoApplications < ActiveRecord::Migration
  def up
    remove_column :interviews, :time_test
    add_column :interviews, :status, :integer
    add_column :applications, :completed_at, :datetime
  end

  def down
    add_column :interviews, :time_test, :decimal
    remove_column :interviews, :status
    remove_column :applications, :completed_at
  end
end

class AddSubmitTimeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :submit_time, :datetime
  end
end

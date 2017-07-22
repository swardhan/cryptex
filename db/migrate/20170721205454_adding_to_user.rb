class AddingToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :level, :integer, default: 0
    add_column :users, :answer_count, :integer, default: 0
  end
end

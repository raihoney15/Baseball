class AddLastActivityAtToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :last_activity_at, :datetime
  end
end

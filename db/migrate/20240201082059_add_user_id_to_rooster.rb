class AddUserIdToRooster < ActiveRecord::Migration[7.1]
  def change
    add_reference(:roosters, :user, foreign_key: true)
  end
end

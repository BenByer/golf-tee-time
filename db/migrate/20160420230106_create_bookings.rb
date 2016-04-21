class CreateBookings < ActiveRecord::Migration
  def change
      create_table :bookings do |t|
      t.integer :user_id
      t.datetime :tee_time_at
      t.integer :golfer_count
      t.timestamps 
    end
  end
end

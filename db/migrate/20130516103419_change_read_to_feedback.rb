class ChangeReadToFeedback < ActiveRecord::Migration
  def up
    change_column_default(:feedbacks, :read, false)
    change_column_default(:messages, :read, false)
    change_column_default(:speakers, :keynote, false)
  end

  def down
  end
end

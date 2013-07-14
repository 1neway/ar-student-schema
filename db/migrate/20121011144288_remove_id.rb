require_relative '../config'

class RemoveId < ActiveRecord::Migration
  def up
    remove_column(:teachers, :student_id)
    remove_column(:students, :teacher_id)
  end

  def down
    add_column(:teachers, :student_id, :integer)
    add_column(:students, :teacher_id, :integer)
  end
end



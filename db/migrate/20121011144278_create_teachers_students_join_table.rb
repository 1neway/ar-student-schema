require_relative '../config'

class CreateTeachersStudentsJoinTable < ActiveRecord::Migration
  def up
    add_column(:teachers, :student_id, :integer)
    create_table :teachers_students, id: false do |t|
      t.integer :teacher_id
      t.integer :student_id
    end
  end

  def down
    drop_table :teachers_students
  end
end



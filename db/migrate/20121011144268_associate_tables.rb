require_relative '../config'

class AssociateTables < ActiveRecord::Migration
  def up
    add_column :students, :teacher_id, :integer
  end

  def down
    remove_column :students, :teacher_id, :integer

  end
end



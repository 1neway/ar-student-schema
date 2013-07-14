require_relative '../config'

class CombineNames < ActiveRecord::Migration
  def up
    add_column :students, :name, :string
    Student.all.each { |student| student.update_attribute(:name, student.combined_name) }
    add_column :students, :address, :string
    remove_column :students, :first_name
    remove_column :students, :last_name
  end

  def down
    add_column :students, :last_name
    add_column :students, :first_name
    Student.all.each { |student| student.update_attribute(:first_name, student.name.split(" ").first)}
    Student.all.each { |student| student.update_attribute(:last_name, student.name.split(" ").last)}
    remove_column :students, :address, :string
    remove_column :students, :name, :string

  end
end



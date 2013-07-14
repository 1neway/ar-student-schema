require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def change
  	create_table :students do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :gender
  		t.date   :birthday
  		t.string :email
  		t.string :phone
  	end
    # HINT: checkout ActiveRecord::Migration.create_table
  end
end


# ------------+
# | students   |
# +------------+
# | id         |
# | first_name |
# | last_name  |
# | gender     |
# | birthday   |
# | email      |
# | phone      |
# +------------+
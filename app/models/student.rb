require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  belongs_to :teacher

  validates :email, format: { with: /.@.+\.../ }, uniqueness: true
  # validates :birthday, presence: true, if: :old_enough?
  validates :phone, format: { with: /\d{3}.*\d{3}.*\d{4}/ }
  validates :age, numericality: { greater_than: 5}

  def combined_name
  	"#{self.first_name} #{self.last_name}"
  end

  def age
  	now = Date.today
  	@age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
  # def old_enough?
  	# @age.to_i > 4
  # end
end



# Add validations to the Student model so that a student cannot be saved unless
# the following requirements are met:

# Email addresses must contain at least one @ character and one . character,
# with at least one character before the @, one character between the @ and
# first ., and at least two characters after the final .. Email addresses
# must be unique across all students. Students must be at least 5 years old.

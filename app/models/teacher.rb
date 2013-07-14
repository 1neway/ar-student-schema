require_relative '../../db/config'

class Teacher < ActiveRecord::Base
  has_many :students
  validates :email, format: { with: /.@.+\.../ }, uniqueness: true

end

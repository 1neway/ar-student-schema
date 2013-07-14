require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'
require_relative 'app/models/teacher'
require_relative 'app/models/student'
require_relative 'app/models/teacher_and_student'



desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the test database with sample data"
task "db:populate" do
  # StudentsImporter.import
  # teacher = Teacher.create(name: "Armin Tamzarian", email: "atamzarian@hotmail.com", phone: "630-345-6789")
  # teacher = Teacher.create(name: "Seymour Skinner", email: "sskinner@hotmail.com",   phone: "5551234567")
  # teacher = Teacher.create(name: "Homer Simpson",   email: "homer@hotmail.com",      phone: "3123456789")
  # teacher = Teacher.create(name: "Israel Obeng",    email: "iob@hotmail.co",         phone: "777 345 6789")
  # teacher = Teacher.create(name: "Edna Krabappel",  email: "ekrabappel",             phone: "7089876543")
  # teacher = Teacher.create(name: "Herman Bavnick",  email: "hbavk@hotmail.com",      phone: "8471234567")
  # teacher = Teacher.create(name: "Hot Mess",        email: "mess@hotmail.com",       phone: "630-564-9876")
  # teacher = Teacher.create(name: "Alphonso Soriano", email: "asoriano@gmail.com",     phone: "800-345-1234")
  # teacher = Teacher.create(name: "Tom Berenger",    email: "tber@aol.com",           phone: "8882346789")
  # Student.all.each { |student| student.update_attribute(:teacher_id, rand(10) + 1) }
  # 54.times { Teachers_student.create(teacher_id: rand(1..9), student_id: (1..54).to_a.sample) }
  
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs

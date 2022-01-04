require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# One to Many associations-Example
# class Project < ActiveRecord::Base
#   belongs_to              :portfolio
#   has_one                 :project_manager
#   has_many                :milestones
#   has_and_belongs_to_many :categories
# end

class Store < ActiveRecord::Base
	has_many :employees
end

class Employee < ActiveRecord::Base
	belongs_to :store
end

# Add some data into employees
@store1.employees.create(first_name: "Kim", last_name: "Vit", hourly_rate: 60)
@store1.employees.create(first_name: "Jaz", last_name: "Pitt", hourly_rate: 50)
@store2.employees.create(first_name: "Li", last_name: "Su", hourly_rate: 40)
@store2.employees.create(first_name: "Andy", last_name: "Mein", hourly_rate: 60)
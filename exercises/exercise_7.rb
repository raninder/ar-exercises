require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"


# Validations

# Employees must always have a first name present
class Employee < ActiveRecord::Base
  validates :first_name, presence: true
end

# Employees must always have a last name present
class Employee < ActiveRecord::Base
  validates :last_name, presence: true
end

# Employees have a hourly_rate that is a number (integer) between 40 and 200
class Employee < ActiveRecord::Base
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
end

# Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
class Employee < ActiveRecord::Base
  validates :stores, :presence => true
end

# Stores must always have a name that is a minimum of 3 characters
class Employee < ActiveRecord::Base
validates :name, length: { minimum: 3 }
end

# Stores have an annual_revenue that is a number (integer) that must be 0 or more

class Store < ActiveRecord::Base
validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

# BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)
class Store < ActiveRecord::Base

  has_many :employees

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validate :apparel_type
	def apparel_type
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "must be true for least one apparel type")
      errors.add(:womens_apparel, "must be true for least one apparel type")
    end
  end
end


# 1.Ask the user for a store name (store it in a variable)
# 2. Attempt to create a store with the inputted name but leave out the other fields (annual_revenue, mens_apparel, and womens_apparel)
# 3.Display the error messages provided back from ActiveRecord to the user (one on each line) after you attempt to save/create the record

puts "Please give me a store name:"
@store_name = gets.chomp

Store.create(name: @store_name)
puts @store_name.errors.messages
class Student < ApplicationRecord

  validates :surname, presence: true
  validates :school, presence: true

end

# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(input)
    array_students = []
    if input == ""
      Student.all
    else
      split_input = input.downcase.split.first.split(//)
      Student.all.each {|student| student_first_name = student.name.split.first.downcase.split(//)[0..split_input.length-1]
        if split_input == student_first_name
          array_students << student
        end
      }
      array_students
    end
  end

end

require 'csv'
require 'descriptive-statistics'
 
class Teacher_assistant 
  #attr_accessor 
 
 
  def initialize(file_name)
    @g_array = CSV.read(file_name) 
  end
 
  def create_hash
    @name_grade = {}
    @array_length = @g_array.length
    @array_length.times do |k|
    @name =  @g_array[0].shift
    @grades =  @g_array.shift
    @name_grade[@name] = @grades
  end
  end
 
  def all_grades
    @all_grades = []
    @name_grade.each_key do 
    @studentgrade_array
    @int_array
    @all_grades.push(@int_array)
  end
  @flatten = @all_grades.flatten
  return @flatten
  end
 
 
  def average(student_name)
 
    @studentgrade_array = @name_grade[student_name] # this is the value (returning the array of grades)
    @int_array = @studentgrade_array.collect {|s| s.to_i} #this instance variable converts the value strings to integers
    @total = @int_array.inject {|sum, n| sum + n}
    @average = (@total/@int_array.length)          #this instance variable is the average of " " grades
    #puts "#{student_name} grade is #{@average}"
    #grade_convert(student_name)
    # puts @int_array
    return @average
 
  end
 
  def grade_convert(student_name)
    if @average >= 90
      return "A"
    elsif @average >= 80 || @average <= 89
      return "B"
    elsif @average >= 70 || @average <= 79
      return "C" 
    elsif @average >= 60 || @average <= 69
      return "D"
    elsif @average < 60
      return "F"
    end
 
  end
 
  def file
    #need to sort by last name 
    puts "What would you like to name your file? (Don't add the extension"
    file_name = gets.chomp
    @name_grade.each_key do |key|
    @collection = [key]                     # this puts student name into an array 
    name_split = @collection[0].split       # this splits the first and last name into two parts in an array 
    name_reverse = name_split.reverse
    p = name_reverse.push(@average)
    file_a = p.push(grade_convert(key))
 
    
    exist = File.exist?(file_name + ".txt")
    if !exist 
      File.open(file_name + ".txt", "w") do |f|  
      f.puts file_a
    end
    else
      File.open(file_name + ".txt","a") do |t|
      t.puts file_a
    end
    end
  end
end
  
  def collect_av
    @all_average = []
    @name_grade.each_key do |key|
      @all_average.push(average(key))
    end
  end
 
  def class_av 
     average = @all_average.inject {|sum, n| sum + n}
     class_average = average/@all_average.length
     puts "The class average is #{class_average}"
  end 
 
  def class_min 
    @all_average.min 
    puts "The lowest class score is #{@all_average.min}"
  end
 
 def class_max 
    @all_average.max 
    puts "The highest class score is #{@all_average.max}"
  end
  
  def class_stand
   all_grades
   z = @flatten.extend(DescriptiveStatistics)              
   puts "The stardard deviation is #{z.standard_deviation}"
  end
 
end
 
t = Teacher_assistant.new('grade.csv')
t.create_hash
t.average('Johnny Smith')  
#t.grade_convert('Johnny Smith')
t.file
t.collect_av
t.class_av
t.class_min
t.class_max
t.class_stand
t.all_grades

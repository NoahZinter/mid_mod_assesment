class Term 

  attr_reader :name, :courses 
  def initialize(name)
    @name = name 
    @courses = []
  end

  def add_course(course)
    @courses << course
  end 

  def list_courses 
    @courses.map do |course| 
      course.name 
    end 
  end 

  def open_courses 
   @courses.select do |course| 
      !course.full? 
    end
  end 

  def list_open_courses 
    open_courses.map do |course| 
      course.name 
    end 
  end 

  def all_students 
    @courses.map do |course| 
        course.students 
    end.flatten! 
  end 

  def list_all_students 
    all_students.map do |student| 
      student.name 
    end  
  end 

end 
require './lib/course'
require './lib/student'

describe Course do 
  it 'exists' do 
    course = Course.new("Calculus", 2)

    expect(course).to be_a(Course)
  end 

  it 'has attributes' do 
    course = Course.new("Calculus", 2)

    expect(course.name).to eq("Calculus")
    expect(course.capacity).to eq(2)
    expect(course.students).to eq([])
  end

  describe "#full?" do 
    it "starts as false" do 
      course = Course.new("Calculus", 2)

      expect(course.full?).to eq(false)
    end

    it 'is true when capacity is full' do 
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      course.enroll(student1)  
      course.enroll(student2)

      expect(course.full?).to eq(true)
    end 
  end

  describe "#enroll" do 
    it "adds student to @students" do
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      course.enroll(student1)  
      course.enroll(student2)   
      
      expect(course.students).to eq([student1, student2])
    end
  end 
    


end 
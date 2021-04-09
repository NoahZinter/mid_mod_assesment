require './lib/student.rb'
require './lib/course.rb'
require './lib/term.rb'

describe Term do 
  it "exists" do 
    term = Term.new("Winter 2021")

    expect(term).to be_a(Term)
  end

  it 'has a name' do 
    term = Term.new("Winter 2021")

    expect(term.name).to eq("Winter 2021")
  end 

  it 'starts with an empty array of courses' do 
    term = Term.new("Winter 2021")

    expect(term.courses).to eq([])
  end 

  describe "#add_course" do 
    it "can add courses" do 
      term = Term.new("Winter 2021") 
      geography = Course.new("Geography", 2)
      math = Course.new("Math", 3)
      pottery = Course.new("Pottery", 3)
      term.add_course(geography)
      term.add_course(math)
      term.add_course(pottery)

      expect(term.courses).to eq([geography, math, pottery])
    end
  end

  describe "#list_courses" do 
    it 'lists courses by name' do 
      term = Term.new("Winter 2021") 
      geography = Course.new("Geography", 2)
      math = Course.new("Math", 3)
      pottery = Course.new("Pottery", 3)
      term.add_course(geography)
      term.add_course(math)
      term.add_course(pottery)

      expect(term.list_courses).to eq(["Geography", "Math", "Pottery"])
    end 
  end 

  describe "#list_open_courses" do 
    it 'returns open courses' do 
      term = Term.new("Winter 2021") 
      geography = Course.new("Geography", 2)
      math = Course.new("Math", 3)
      pottery = Course.new("Pottery", 3)
      term.add_course(geography)
      term.add_course(math)
      term.add_course(pottery)

      expect(term.list_open_courses).to eq(["Geography", "Math", "Pottery"])
    end

    it 'does not return full courses' do 
      term = Term.new("Winter 2021") 
      geography = Course.new("Geography", 2)
      math = Course.new("Math", 3)
      pottery = Course.new("Pottery", 3)
      term.add_course(geography)
      term.add_course(math)
      term.add_course(pottery)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      geography.enroll(student1)
      geography.enroll(student2)

      expect(term.list_open_courses).to eq(["Math", "Pottery"])
    end 
  end 

  describe "#list_all_students" do 
    it 'lists students across all courses' do 
      term = Term.new("Winter 2021") 
      geography = Course.new("Geography", 2)
      math = Course.new("Math", 3)
      pottery = Course.new("Pottery", 3)
      term.add_course(geography)
      term.add_course(math)
      term.add_course(pottery)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Tim", age: 43})
      student4 = Student.new({name: "Alice", age: 19})
      geography.enroll(student1)
      geography.enroll(student2)
      math.enroll(student3)
      pottery.enroll(student4)

      expect(term.list_all_students).to eq(["Morgan", "Jordan", "Tim", "Alice"])
    end
  end 

end

require './lib/student'

describe Student do 
    it 'exists' do 
        student = Student.new({name: "Morgan", age: 21})    

        expect(student).to be_a(Student)
    end 

    it 'has attributes' do 
        student = Student.new({name: "Morgan", age: 21})    

        expect(student.name).to eq("Morgan")
        expect(student.age).to eq(21)
        expect(student.scores).to eq([])
    end 

    describe "#log_score" do 
        it 'adds scores to @scores' do  
        student = Student.new({name: "Morgan", age: 21})    
        student.log_score(89)
        student.log_score(78)

        expect(student.scores).to eq([89, 78])
        end
    end 

    describe '#grade' do 
        it 'returns an average of all scores' do 
            student = Student.new({name: "Morgan", age: 21})    
            student.log_score(89)
            student.log_score(78)

            expect(student.grade).to eq(83.5)
        end
    end
     
end 
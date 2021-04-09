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
end

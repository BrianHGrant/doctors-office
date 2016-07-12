require ('rspec')
require ('pg')
require ('specialty')

DB = PG.connect({:dbname => "doctor_office_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM specialties *;")
  end
end

describe("Specialty") do
  describe("#name") do
    it("will return the name of the specialty when entered") do
      test_specialty = Specialty.new(:name => "Optmologist", :id => "1")
      expect(test_specialty.name()).to(eq("Optmologist"))
    end
  end
  describe(".all") do
    it("is an empty array of specialty at first") do
      expect(Specialty.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("will save a specialty to the array of stored specialties") do
      test_specialty = Specialty.new({:name => "Optmologist", :id => "1"})
      test_specialty.save()
      expect(Specialty.all()).to(eq([test_specialty]))
    end
  end

  describe("#id") do
    it("returns the specialty by the ID") do
      test_specialty = Specialty.new({:name => "Optmologist", :id => "1"})
      test_specialty.save()
      expect(test_specialty.id()).to(eq(1))
    end
  end

  describe(".clear") do
    it("empties the array of stored specialties") do
      test_specialty1 = Specialty.new({:name => "Optmologist", :id => "1"})
      test_specialty1.save()
      test_specialty2 = Specialty.new({:name => "Optmologist", :id => "1"})
      test_specialty2.save()
      Specialty.clear()
      expect(Specialty.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("find a specialty by its ID") do
      test_specialty = Specialty.new({:name => "Optmologist", :id => "1"})
      test_specialty.save()
      expect(Specialty.find(test_specialty.id())).to(eq("Optmologist"))
    end
  end

  describe("#==") do
    it("will compare two instances of Specialty class and return equal if name and id are the same") do
      test_specialty1 = Specialty.new({:name => "Optmologist", :id => "1"})
      test_specialty2 = Specialty.new({:name => "Optmologist", :id => "1"})
      expect(test_specialty1).to(eq(test_specialty2))
    end
  end

end


# describe ('#specialty') do
#   test_specialty = Specialty.new({:name => 'Dental'})
#   expect(test_specialty.specialty()).to(eq('Dental'))
# end

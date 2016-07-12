require ('rspec')
require ('pg')
require ('doctor')

DB = PG.connect({:dbname => "doctor_office_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
  end
end

describe ('Doctor') do
  describe ('#name') do
    it('will create new doctor') do
      test_doctor = Doctor.new({:name => 'Patch Adams', :specialty_id => 3, :id => nil})
      expect(test_doctor.name()).to(eq('Patch Adams'))
    end
  end

  describe('.all') do
    it('is an empty list of doctors at first') do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the doctor to the array of saved doctors') do
      test_doctor = Doctor.new({:name => "Patch Adams", :specialty_id => 3, :id => nil})
      test_doctor.save()
      expect(Doctor.all()).to(eq([test_doctor]))
    end
  end

  describe('#id') do
    it('returns ID of a doctor in the office') do
      test_doctor = Doctor.new({:name => "Patch Adams", :specialty_id => 3, :id => 1})
      expect(test_doctor.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('find the doctor by his/her ID') do
      test_doctor = Doctor.new({:name => "Patch Adams", :specialty_id => 3, :id => nil})
      test_doctor.save()
      expect(Doctor.find(test_doctor.id())).to(eq("Patch Adams"))
    end
  end

  describe("#==") do
    it('is the same doctor if it has the same name and ID') do
      doctor1 = Doctor.new({:name => "Patch Adams", :id => 1, :specialty_id => 3, :id => nil})
      doctor2 = Doctor.new({:name => "Patch Adams", :id => 1, :specialty_id => 3, :id => nil})
      expect(doctor1).to(eq(doctor2))
    end
  end

end

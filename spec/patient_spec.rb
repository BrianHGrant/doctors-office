require ('rspec')
require ('pg')
require ('patient')

DB = PG.connect({:dbname => "doctor_office_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
  end
end

describe('Patient') do
  describe('#name') do
    it ('will return the patients name for a new patient') do
      test_patient = Patient.new({:name => "Bobby Mcgee", :doctor_id => 4, :id => nil})
      expect(test_patient.name()).to(eq("Bobby Mcgee"))
    end
  end

  describe('.all') do
    it('is an empty array at first') do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a new patient to the array of saved patients') do
      test_patient = Patient.new({:name => "Bobby Mcgee", :doctor_id => 4, :id => nil})
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe('#id') do
    it('returns the patient by his/her ID') do
      test_patient = Patient.new({:name => "Bobby Mcgee", :doctor_id => 4, :id => 1})
      expect(test_patient.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('finds the patient by his/her ID') do
      test_patient = Patient.new({:name => "Bobby Mcgee", :doctor_id => 4, :id => 1})
      test_patient.save()
      expect(Patient.find(test_patient.id())).to(eq("Bobby Mcgee"))
    end
  end

  describe('#doctor_id') do
    it('returns the doctor_id for a patient') do
      test_patient  = Patient.new({:name => "Bobby Mcgee", :doctor_id => 4, :id => nil})
      expect(test_patient.doctor_id()).to(eq(4))
    end
  end

  describe("#==") do
    it('is the same patient if it has the same name and ID') do
      patient1 = Patient.new({:name => "Bobby Mcgee", :id => 1, :doctor_id => 4})
      patient2 = Patient.new({:name => "Bobby Mcgee", :id => 1, :doctor_id => 4})
      expect(patient1).to(eq(patient2))
    end
  end
end

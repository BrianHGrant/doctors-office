require ('rspec')
require ('patient')

describe('Patient') do
  describe('#name') do
    it ('will return the patients name for a new patient') do
      test_patient = Patient.new({:name => "Bobby Mcgee"})
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
      test_patient = Patient.new({:name => "Bobby Mcgee"})
      expect(test_patient.save()).to(eq([test_patient]))
    end
  end

  describe('.clear') do
    it('empties the array of saved patients') do
      test_patient = Patient.new({:name => "Bobby Mcgee"})
      test_patient.save()
      test_patient2 = Patient.new({:name => "Michael Kuku"})
      test_patient2.save()
      expect(Patient.clear()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the patient by his/her ID') do
      test_patient = Patient.new({:name => "Bobby Mcgee"})
      expect(test_patient.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('finds the patient by his/her ID') do
      test_patient = Patient.new({:name => "Bobby Mcgee"})
      test_patient.save()
      expect(Patient.find(1)).to(eq("Bobby Mcgee"))
    end
  end
end

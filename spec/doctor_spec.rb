require ('rspec')
require ('doctor')

describe ('Doctor') do
  describe ('#name') do
    it('will create new doctor') do
      test_doctor = Doctor.new({:name => 'Patch Adams', :specialty => "Dental"})
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
      test_doctor = Doctor.new({:name => "Patch Adams", :specialty => "Dental"})
      expect(test_doctor.save()).to(eq([test_doctor]))
    end
  end

  describe('.clear') do
    it('clears the array of saved doctors') do
      test_doctor = Doctor.new({:name => "Patch Adams", :specialty => "Dental"})
      test_doctor.save()
      test_doctor2 = Doctor.new({:name => "George Washington Carver", :specialty => "Eyes"})
      test_doctor2.save()
      Doctor.clear()
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns ID of a doctor in the office') do
      test_doctor = Doctor.new({:name => "Patch Adams", :specialty => "Dental"})
      expect(test_doctor.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('find the doctor by his/her ID') do
      test_doctor = Doctor.new({:name => "Patch Adams", :specialty => "Dental"})
      test_doctor.save()
      expect(Doctor.find(1)).to(eq("Patch Adams"))
    end
  end

end

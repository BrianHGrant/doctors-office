require ('rspec')
require ('doctor')

describe ('Doctor') do
  describe ('#name') do
    it('will create new doctor') do
      test_doctor = Doctor.new({:name => 'Patch Adams'})
      expect(test_doctor.name()).to(eq('Patch Adams'))
    end
  end
end

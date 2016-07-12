class Doctor
  attr_reader(:name, :id, :specialty)

  @@doctors = []

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = @@doctors.length.+(1)
    @specialty = attributes.fetch(:specialty)
  end

  define_singleton_method (:all) do
    @@doctors
  end

  define_method (:save) do
    @@doctors.push(self)
  end

  define_singleton_method (:clear) do
    @@doctors = []
  end

  define_singleton_method (:find) do |id|
    doctor_found = nil
    @@doctors.each do |doctor|
      if doctor.id.eql?(id)
        doctor_found = doctor.name()
      end
    end
    doctor_found
  end
end

class Doctor
  attr_reader(:name, :id, :specialty_id)

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @specialty_id = attributes.fetch(:specialty_id)
  end

  define_singleton_method (:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i()
      specialty_id = doctor.fetch("specialty_id").to_i()
      doctors.push(Doctor.new({:name => name, :id => id, :specialty_id => specialty_id}))
    end
    doctors
  end

  define_method (:save) do
    result = DB.exec("INSERT INTO doctors (name, specialty_id) VALUES ('#{@name}', '#{@specialty_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method (:find) do |id|
    doctor_found = nil
    @@doctors = Doctor.all()
    @@doctors.each do |doctor|
      if doctor.id.eql?(id)
        doctor_found = doctor.name()
      end
    end
    doctor_found
  end

  define_method(:==) do |another_doctor|
    self.name().==(another_doctor.name())
  end
end

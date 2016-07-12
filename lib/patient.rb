class Patient
  attr_reader(:name, :id)

  @@patients = []

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = @@patients.length.+(1)
  end

  define_singleton_method (:all) do
    @@patients = []
  end

  define_method (:save) do
    @@patients.push(self)
  end

  define_singleton_method (:clear) do
    @@patients = []
  end

  define_singleton_method (:find) do |id|
    patient_found = nil
    @@patients.each() do |patient|
      if patient.id() == id
        patient_found = patient.name()
      end
    end
    patient_found
  end
end

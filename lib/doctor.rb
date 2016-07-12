class Doctor
  attr_reader(:name)

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_singleton_method (:all) do
    @@doctors = []
  end

  define_method (:save) do
    @@doctors.push(self)
  end

  define_singleton_method (:clear) do
    @@doctors = []
  end
end

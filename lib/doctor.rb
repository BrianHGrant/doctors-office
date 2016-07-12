class Doctor
  attr_reader(:name, :id)

  @@doctors = []

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = @@doctors.length.+(1)
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

  # define_method (:id) do
  #
  # end
end

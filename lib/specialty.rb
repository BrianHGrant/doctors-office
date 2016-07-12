class Specialty
  attr_reader(:name, :id)

  @@specialties = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i()
  end

  define_singleton_method(:all) do
    @@specialties
  end

  define_method(:save) do
    @@specialties.push(self)
  end

  define_singleton_method(:clear) do
    @@specialties = []
  end

  define_singleton_method(:find) do |id|
    specialty_found = nil
    @@specialties.each() do |specialty|
      if specialty.id().eql?(id)
        specialty_found = specialty.name()
      end
    end
    specialty_found
  end

  define_method(:==) do |another_specialty|
    self.name().==(another_specialty.name()).&(self.id().==(another_specialty.id()))
  end
end

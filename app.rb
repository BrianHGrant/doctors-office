require ('sinatra')
require ('sinatra/reloader')
require ('pg')
require ('./lib/doctor')
require ('./lib/patient')
require ('./lib/specialty')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "doctor_office"})

get('/') do
  @specialties = Specialty.all()
  erb(:index)
end

get('/specialties/new') do
  erb(:specialty_form)
end

post('/specialties') do
  name = params.fetch("name")
  specialty = Specialty.new({:name => name, :id => nil})
  specialty.save()
  erb(:specialty_success)
end

get('/specialties/:id') do
  specialty_doctors = []
  @specialty = Specialty.find(params.fetch("id").to_i())
  @doctors = @specialty.doctors()
  erb(:specialty)
end

get('/specialties/:id/doctors/new') do
  @specialty = Specialty.find(params.fetch("id").to_i())
  erb(:doctors_form)
end

post ('/specialties/:id/doctors') do
  @specialty = Specialty.find(params.fetch("id").to_i())
  specialty_doctors = []
  name = params.fetch("name")
  specialty_id = params.fetch("specialty_id")
  doctor = Doctor.new({:name => name, :id => nil, :specialty_id => specialty_id})
  @doctors = @specialty.doctors()
  erb(:specialty)
end

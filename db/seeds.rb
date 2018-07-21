# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

directorates = [
  "Finance & Administration",
  "Informatics",
  "Operations",
  "Public Health Informatics",
]

directorates.each do |directorate|
  Directorate.create(name: directorate).errors
end

departments = [
  ["Software Development", "Informatics"],
  ["Software Development", "Public Health Informatics"],
  ["Product Management", "Informatics"],
  ["Product Management", "Public Health Informatics"],
  ["M & E Department", "Informatics"],
  ["Support & Deployment", "Operations"],
  ["Engineering", "Operations"],
  ["Administration", "Finance & Administration"],
  ["Finance", "Finance & Administration"],
  ["Human Resource", "Finance & Administration"],
]

departments.each do |department, directorate|
  puts "Creating departments: name => #{department}, directorate => #{directorate}"
  Department.create(
    name: department,
    directorate_id: Directorate.find_by_name(directorate).id,
  )
end

# Create Positions
CSV.foreach("#{Rails.root}/app/assets/data/positions.csv", headers: true, encoding: "ISO-8859-1") do |row|
  puts "Creating positions: #{row[0]}"
  Position.create(name: row[0])
end

# Create Donors
CSV.foreach("#{Rails.root}/app/assets/data/donors.csv", headers: true, encoding: "ISO-8859-1") do |row|
  puts "Creating donors: #{row[0]}"
  Donor.create(name: row[0], abbreviation: row[1])
end

# Create Projects
CSV.foreach("#{Rails.root}/app/assets/data/projects.csv", headers: true, encoding: "ISO-8859-1") do |row|
  puts "Creating projects: #{row[0]}"
  Project.create(
    name: row[0],
    donor_id: Donor.find_by_abbreviation(row[1]).id,
  )
end

roles = [
  ["admin", "Admin user of the application"],
  ["standard", "A standard user"],
]

roles.each do |name, description|
  Role.create(name: name, :description => description)
end

user = User.create(
  email: "admin@baobabhealth.org",
  password: "test",
  roles: [Role.find_by_name("admin")],
)

employee = Employee.create(
  user: user,
  firstname: "Admin",
  lastname: "User",
  directorate: Directorate.find_by_name("Finance & Administration"),
  position: Position.find_by_name("HR Manager"),
)

puts employee.errors.to_json

puts "Your new user is: admin@baobabhealth.org, password: test"

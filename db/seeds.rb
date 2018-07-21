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
  Directorate.create(name: directorate)
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
  Department.create(
    department: department,
    directorate: Directorate.find_by_name(directorate)[0],
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
    donor: Donor.find_by_abbreviation(row[1])[0],
  )
end

roles = [
  ["admin", "Admin user of the application"],
  ["standard", "A standard user"],
]

roles.each do |r, desc|
  Role.create(:role => r, :description => desc)
end

user = User.create(
  username: "admin",
  password_hash: "test",
  employee: Employee.create(
    first_name: "Admin",
    last_name: "User",
    directorate: Directorate.find_by_name("Finance & Admin")[0],
  ),
)

user_role = UserRole.create(
  :user_id => user.id,
  :role => Role.find_by_name("admin"),
)

puts "Your new user is: admin, password: test"

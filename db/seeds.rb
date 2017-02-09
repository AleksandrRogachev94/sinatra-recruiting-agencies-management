require_relative '../config/environment'

manpower = Agency.create(username: "Manpower", email: "manpower@gmail.com", password: "12345")
kelly = Agency.create(username: "Kelly", email: "kelly@gmail.com", password: "13254")

alex = Recruiter.create(username: "Alex", email: "alex@gmail.com", speciality: "it", password: "111")
josh = Recruiter.create(username: "Josh", email: "josh@gmail.com", speciality: "it", password: "222")
ron = Recruiter.create(username: "Ron", email: "ron@gmail.com", speciality: "finance", password: "333")
bob = Recruiter.create(username: "bob", email: "bob@gmail.com", speciality: "finance", password: "444")
alice = Recruiter.create(username: "alice", email: "alice@gmail.com", speciality: "it", password: "555")

vac1 = Vacancy.create(title: "Junior web developer", salary: 60000, description: "The Junior Software Developer is responsible for developing, modifying, and maintaining software applications")
vac2 = Vacancy.create(title: "Web developer", salary: 80000, description: "This Full Stack Developer will be a central role in our engineering team")
vac3 = Vacancy.create(title: "Senior Web developer", salary: 100000, description: "We are looking for a full stack web developer who loves building impressive web applications")
vac4 = Vacancy.create(title: "Senior Accountant", salary: 110000, description: "We are growing and are currently looking for a Senior Accountant to add to our team.")
vac5 = Vacancy.create(title: "Inventory Accountant", salary: 50000, description: "The Inventory Accountant must regularly analyze and record all inventory adjustments, as well as determine the cause for inventory price discrepancies")
vac6 = Vacancy.create(title: "Cashier", salary: 40000, description: "We are looking for an experienced Cashiers to work at the Music City Center")
vac7 = Vacancy.create(title: "Java developer", salary: 79000, description: "Developers must be able to work in a team and are expected to be able to learn new languages quickly.")
vac8 = Vacancy.create(title: "Junior web developer", salary: 55000, description: "The Junior Software Developer is involved in all areas of development from design to development to testing.")

hp = Company.create(name: "HP", email: "hp@gmail.com")
bridgestone = Company.create(name: "Bridgestone", email: "bridgestone@gmail.com")
google = Company.create(name: "Google", email: "google@gmail.com")
yahoo = Company.create(name: "Yahoo", email: "yahoo@gmail.com")
linkedin = Company.create(name: "LinkedIn", email: "linked@gmail.com")

#Connections

manpower.recruiters.concat(alex)
manpower.recruiters.concat(josh)
manpower.recruiters.concat(bob)
kelly.recruiters.concat(ron)
kelly.recruiters.concat(alice)

alex.vacancies.concat(vac1)
alice.vacancies.concat(vac1)
josh.vacancies.concat(vac2)
josh.vacancies.concat(vac3)
alice.vacancies.concat(vac7)
alice.vacancies.concat(vac8)
ron.vacancies.concat(vac4)
ron.vacancies.concat(vac5)
bob.vacancies.concat(vac4)
bob.vacancies.concat(vac6)

google.vacancies.concat(vac1)
yahoo.vacancies.concat(vac2)
yahoo.vacancies.concat(vac3)
google.vacancies.concat(vac7)
linkedin.vacancies.concat(vac8)
hp.vacancies.concat(vac4)
hp.vacancies.concat(vac5)
bridgestone.vacancies.concat(vac6)

require_relative '../config/environment'

agency1 = Agency.create(username: "Agency Ex 1", email: "agency1@gmail.com", password: "1234")
agency2 = Agency.create(username: "Agency Ex 2", email: "agency2@gmail.com", password: "12345")

alex = Recruiter.create(username: "Alex", email: "alex@gmail.com", speciality: "IT", phone: "1111111111", password: "111")
josh = Recruiter.create(username: "Josh", email: "josh@gmail.com", speciality: "IT", phone: "1111111111", password: "222")
ron = Recruiter.create(username: "Ron", email: "ron@gmail.com", speciality: "Finance", phone: "1111111111", password: "333")
bob = Recruiter.create(username: "Bob", email: "bob@gmail.com", speciality: "Finance", phone: "1111111111", password: "444")
alice = Recruiter.create(username: "Alice", email: "alice@gmail.com", speciality: "IT", phone: "1111111111", password: "555")

vac1 = Vacancy.create(title: "Junior web developer", company: "Google", salary: 60000, company_phone: "1111111111", description: "The Junior Software Developer is responsible for developing, modifying, and maintaining software applications")
vac2 = Vacancy.create(title: "Web developer", company: "Yahoo", salary: 80000, company_phone: "1111111111", description: "This Full Stack Developer will be a central role in our engineering team")
vac3 = Vacancy.create(title: "Senior Web developer", company: "Yahoo", salary: 100000, company_phone: "1111111111", description: "We are looking for a full stack web developer who loves building impressive web applications")
vac4 = Vacancy.create(title: "Senior Accountant", company: "HP", salary: 110000, company_phone: "1111111111", description: "We are growing and are currently looking for a Senior Accountant to add to our team.")
vac5 = Vacancy.create(title: "Inventory Accountant", company: "HP", salary: 50000, company_phone: "1111111111", description: "The Inventory Accountant must regularly analyze and record all inventory adjustments, as well as determine the cause for inventory price discrepancies")
vac6 = Vacancy.create(title: "Cashier", company: "Bridgestone", salary: 40000, company_phone: "1111111111", description: "We are looking for an experienced Cashiers to work at the Music City Center")
vac7 = Vacancy.create(title: "Java developer", company: "Google", salary: 79000, company_phone: "1111111111", description: "Developers must be able to work in a team and are expected to be able to learn new languages quickly.")
vac8 = Vacancy.create(title: "Junior web developer", company: "LinkedIn", salary: 55000, company_phone: "1111111111", description: "The Junior Software Developer is involved in all areas of development from design to development to testing.")

#Connections

agency1.recruiters.concat(alex)
agency1.recruiters.concat(josh)
agency1.recruiters.concat(bob)
agency2.recruiters.concat(ron)
agency2.recruiters.concat(alice)

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

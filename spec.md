# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app  
The project was made using Sinatra framework for Ruby
- [x] Use ActiveRecord for storing information in a database  
ActiveRecord is used for all models in this project.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)  
5 models: Agency, Recruiter, Vacancy, RecruiterVacancy, Request.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)  
For example, Recruiter has many Vacancies, Vacancy has many Recruiters.
- [x] Include user accounts  
Both agencies and recruiters have user accounts. Both can log in. Only Agencies can Sign up and they can create new accounts for their Recruiters.
- [x] Ensure that users can't modify content created by other users  
All validations were implemented to prevent private information rendering without appropriate permission.
- [x] Include user input validations  
All validations were implemented.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)  
Users will will see all validation errors.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code  
Done.

Confirm
- [x] You have a large number of small Git commits  
- [x] Your commit messages are meaningful  
- [x] You made the changes in a commit that relate to the commit message  
- [x] You don't include changes in a commit that aren't related to the commit message  

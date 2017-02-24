# Recruiting Agencies Management

This Web Application was created to manage recruiting Agencies. Below the major functionality is described.
Each Agency has multiple recruiters and vacancies. Agency can create recruiters, so later each recruiter can log in (but they can't sign up).
Each vacancy has many recruiters and each recruiter has many vacancies, but within one agency only one recruiter can deal with certain vacancy. Agencies share vacancies between each other. Each agency can create its own vacancy or choose from the shared list. Recruiter can make a request to his agency in order to close vacancy. Then agency can confirm this request and delete vacancy or decline the request.

[Site on heroku](https://recruiting-agencies-manager.herokuapp.com)

[Blog Post about this application](http://aleksandr-rogachev-blog.com/2017/02/13/sinatra_recruiting_agencies_management/)


![Alt text](/schema.png?raw=true "Schema")


## Installation

Clone the repository and then execute:

    $ bundle

Install postgresql on your system, create environmental variables PG_USER and PG_PASS.

## Usage

This guide is about running this application **locally** (in development environment).
Execute:

    $ rake db:migrate

If you want, you can use fake data from db/seeds.rb (you can see all necessary data including password in this file). Execute:

    $ rake db:seed

To start the server execute:

    $ rackup

Go to http://localhost:9292.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AleksandrRogachev94/sinatra-recruiting-agencies-management. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

This Web Application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

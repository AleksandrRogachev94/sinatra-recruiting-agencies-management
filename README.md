# Recruiting Agencies Management

This Web Application was created to manage recruiting Agencies. Below the major functionality is described.
Each Agency has multiple recruiters and vacancies. Agency can create recruiters so later each recruiter can log in (but they can't sign up).
Each vacancy has many recruiters and each recruiter has many vacancies, but within one agency only one recruiter can deal with certain vacancy. Agencies share vacancies between each other. Each agency can create its own vacancy or choose from the shared list. Recruiter can make a request to his agency in order to close vacancy. Then agency can confirm this request and delete vacancy or decline the request.

![Alt text](/schema.png?raw=true "Schema")

## Installation

Clone the repository and then execute:

    $ bundle

## Usage

If you don't want to use default database, delete it (db/agencies_db.sqlite) and then execute

    $ rake db:migrate

To start the server execute:

    $ rackup

Go to http://localhost:8282.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AleksandrRogachev94/sinatra-recruiting-agencies-management. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

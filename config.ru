require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use SessionsController
use RecruitersController
use VacanciesController
use AgenciesController
use RequestsController
run ApplicationController

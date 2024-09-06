# README

This README would normally document whatever steps are necessary to get the
application up and running.

Details:

* Ruby version:
ruby 3.3.4 (2024-07-09 revision be1089c8ec) [x64-mingw-ucrt]

* Rails version:
Rails 7.1.3.4

* System dependencies
- None but some gems are important:
    - gem 'kaminari'            : For pagination
    - gem 'aws-sdk-s3'          : For Amazon S3 gem
    - gem 'image_processing'    : For image Active Storage

* Configuration

* Database creation
- Postgresql (currently on render)

* Database initialization
- Standard approach..

* How to run the test suite
- None

* Services (job queues, cache servers, search engines, etc.)
- None

* Deployment instructions

* ...

* Personal Comments: 
- Originally was # class ApplicationController < ActionController::Base
- Changing to # class ApplicationController < ActionController::Base to class ApplicationController < ActionController::API in application_controller.rb has caused issues with rendering the views.
- I wonder what's a good solution?
- Make ApplicationController inherit from ActionController::API instead of ActionController::Base. 
- As with middleware, this will leave out any Action Controller modules that provide 
- functionalities primarily used by browser applications.
- Maybe I'll create a new controller to inherit from class ApplicationController < ActionController::Base

* Test (windows):
Invoke-RestMethod -Method Post -Uri http://localhost:3000/users

* Test (linux / ubuntu):
curl -X POST localhost:3000/users 
## Menu tests for FieldAware.com

### Pre-requisites for setting up the framework:
- Ruby installed: version 2.1.0 or newer
- Bundler gem installed (https://rubygems.org/gems/bundler). From the Terminal execute: `gem install bundler`

### Installing the framework:
- checkout this Git repository
- from the Terminal, navigate to the root folder where the project was checked out and execute: `bundle install`

### Running the tests:
- from the Terminal, navigate to the root folder where the project was checked out and execute: `cucumber`

### Evaluating test results:
- from the `features/reports/` folder, open the report.html file
- in case some tests failed, a screenshot of the moment when the error happened will be attached in the report
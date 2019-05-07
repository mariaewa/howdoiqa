# How do I QA?
Introduction to acceptance testing

FORK THE PROJECT!
>(Forking is creating your own instance of the project, where you can make all the changes you want, and commit your specs without spoiling the fun to anyone else. To fork the project, look for `Fork` button at the top right corner of this page.)

# Dependencies
**Download and set these up first.**

1. MacOS up to date (older versions may not allow you to install Xcode)

2. Xcode (download from AppStore, run and accept the T&C):

- In OSX 10.9+ you may need to install xCode command tools to allow you to install libiconv.
`xcode-select --install`

3. Ruby 2.1.5
- Install RVM (if you don't have it)
`\curl -sSL https://get.rvm.io | bash`

- Install Ruby 2.1.5
`rvm install "ruby-2.1.5"`

4. Postgres (database)
- Install Homebrew (package manager)
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

- Install Postgres using Homebrew
`brew install postgresql`

- Check if Postgres is running
`brew services list`

If you see the message that postgresql has started (https://monosnap.com/file/cSP6KmYmNlVRRHTE1ylJMxlXfh5PCS) then you are ok to go. If not, run:
`brew services start postgresql`

And check again.

5. Libraries for nokogiri gem
One of the gems - nokogiri - requires few libraries to be installed first:

- Install libraries:
`brew install libxml2 libxslt libiconv`

- You may need to link libiconv
`brew link libiconv`

# Database setup
We're using postgres. Make sure it's running :) Then log in to template with this command line:

Ubuntu: `sudo -u postgres psql template1`
MacOS: `psql template1`

You will now be in psql command line.
After that in the console run the development setup script - this script is already filled in with passwords, etc.
If you want to change any of the information in there you will need to change it also in database.yml later!

In the pql console run: `\i <PATH_TO_PROJECT>/db/development_setup_script.sql` (you can get the current path by typing `pwd`)
Exit console by typing `\q`

**Copy database.yml.sample to database.yml**:
`cp config/database.yml.sample config/database.yml`

Run `bundle install` to install all the needed gems (this step is complete once all gems listed by this command are green).
Then `rake db:reseed` to populate development environment with example data.
Load test database with `rake db:test:load`.

# Troubleshooting
1. Postgres user - in case you downloaded the Postgres app and created Super Admin here, remember the password you provided. If you cannot enter psql command line, run:
`psql --u postgres template1`
and enter your Super Admin's password.

2. If you cannot install nokogiri gem even after installing all libraries, try to install it by running:
`bundle config build.nokogiri "--use-system-libraries --with-xml2-include=/usr/local/opt/libxml2/include/libxml2"`

And then:
`bundle install`

# Credentials
**Seeds have a user already created for you.**
`admin@example.com` with password `12345678`

# Run server
`rails s`

To access the page, type `http://localhost:3000/` in the browser address bar.

If you are getting an error about "Ignoring some gems" when running `rails s` (error: https://monosnap.com/file/zS6mWQeW0h7kMOAU2z0yjS9ansbxSA), try to run:
`gem pristine --all`

# Run specs (if any)
- Run all specs:
`rspec spec`

- Run specific spec:
`rspec spec/features/nameOfSpec_spec.rb`

# Hints

- To see the interface of Chrome browser add:
`js: true`
at the beginning of your spec, like this:

`require 'rails_helper'
feature 'my spec', js: true do
end`

- To stop/freeze the spec running after the chosen step you can add:
`binding.pry`
which stops the spec and it lets you see what happened after the particular action.
It also activates the rails/pry console in the terminal which you may use to debug your spec.
REMEMBER to remove binding.pry after debugging the spec.

# Change driver
In capybara.rb file (you can find it in spec/support/ folder) you can change driver to Headless (which means specs will run without running Chrome interface) by changing the line:
`Capybara.javascript_driver = :chrome`
to:
`Capybara.javascript_driver = :headless_chrome`

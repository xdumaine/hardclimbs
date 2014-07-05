HardClimbs.info
==========

HardClimbs.info is a collaborative effort to create an online resource which catalogs the world's hardest rock climbs.  This repository is the home of the site's source code with the site itself being deployed on Heroku.

If you'd like to help contribute, feel free to fork this repo and make changes.  If you have an idea for something new or a big change to existing functionality it's best to open an issue first so that the idea can be reviewed before you spend a lot of time working on something that doesn't fit with the vision for hte site.

You will need to use PostgreSQL to do your local development.  The code as it exists today is still very much beta and needs some refinement.  I will be adding bugs and feature requests to the Issues list on this repo in the coming days to help guide some of the work that needs to be done.

Site dependencies include but are not limited to:

* Twitter Bootstrap 2.3 - http://getbootstrap.com/2.3.2/
* Rails 3.2.13
* Ruby 2.0
* Twitter Typeahead - https://github.com/twitter/typeahead.js/
* Hogan.js - http://twitter.github.io/hogan.js/
* Chosen - http://harvesthq.github.io/chosen/
* jVectorMap - http://jvectormap.com/
* pg_search - https://github.com/Casecommons/pg_search

Local development with Vagrant
-----

HardClimbs.info is hosted with Heroku. These instructions use Virtualbox, Vagrant, and a [pre-built Vagrant base box](https://github.com/ejholmes/vagrant-heroku) to closely mirror Heroku's Celadon Cedar stack.

1. Install [Virtualbox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/).

2. Create a new directory and initialize Vagrant on it:

        $ mkdir hardclimbs.info
        $ cd hardclimbs.info
        $ vagrant init

3. Customize the newly-created `Vagrantfile`:

        config.vm.box = "heroku"
        config.vm.box_url = "https://dl.dropboxusercontent.com/s/rnc0p8zl91borei/heroku.box"
        config.vm.network :forwarded_port, guest: 3000, host: 8080

4. [Fork this repository](https://github.com/Dhaulagiri/hardclimbs/fork) and clone it into the same directory as your `Vagrantfile`:

        $ git clone git@github.com:{your_github_username}/hardclimbs.git

5. Create a new config file, `hardclimbs/config/database.yml`, with the following contents:

        development:
          adapter: postgresql
          encoding: unicode
          template: template0
          database: hardclimbs_development
          pool: 5
          username: postgres
          password:

6. Start and log in to the Vagrant VM:
        
        $ vagrant up
        $ vagrant ssh
        
7. Upgrade Ruby to v2.0.0:

        vagrant@heroku:~$ \curl -L https://get.rvm.io | bash
        vagrant@heroku:~$ source ~/.rvm/scripts/rvm
        vagrant@heroku:~$ rvm install 2.0.0
        vagrant@heroku:~$ rvm use 2.0.0 --default

8. Initialize the Rails project:

        vagrant@heroku:~$ cd /vagrant/hardclimbs/
        vagrant@heroku:~$ bundle install
        vagrant@heroku:~$ rake db:setup
        vagrant@heroku:~$ rake db:migrate
        vagrant@heroku:~$ rails server -d

9. Visit [http://localhost:8080](http://localhost:8080) with your web browser. If all went well, you'll be looking at a copy of the hardclimbs.info home page.

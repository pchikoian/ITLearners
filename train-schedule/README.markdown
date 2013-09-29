# Train Schedule Service

## Dependencies

* Ruby 1.9.2
* MySQL 

### RVM

To install RVM, just execute:

    curl -L https://get.rvm.io | bash -s stable

You need to load rvm whenever your shell is started. If you are using bash, execute the following command to modify your `~/.bash_profile`.

    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile

Up to your shell and setting, you might want to add this into `~/.bashrc` or `~/.zshrc`.

Restart your shell (terminal) and try to execute `rvm --version` for final check:

    $ rvm --version
    rvm 1.18.15 () by Wayne E. Seguin <wayneeseguin@gmail.com>, Michal Papis <mpapis@gmail.com> [https://rvm.io/]

### Ruby 1.9.3-p392

It's easy to install Ruby 1.9.3-p392 with RVM:

    rvm install 1.9.3-p392
    rvm use 1.9.3 --default

To test if the installation is OK:

    $ ruby --version
    ruby 1.9.3p392 (2013-02-22 revision 39386) [x86_64-darwin12.3.0]

### MySQL

The most simple way to install MySQL on Mac OS is via homebrew:

    brew install mysql

Then follow the instruction of brew to complete the installation. The most simple way is:

    unset TMPDIR
    mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=#{var}/mysql --tmpdir=/tmp

On Ubuntu, you can install MySQL by apt-get:

   apt-get install mysql-server mysql-client

### NodeJS

On Mac, you can install NodeJS with brew:

    brew install node

On Ubuntu, you can install NodeJS with apt-get:

    apt-get install nodejs

## Getting Started

First, clone the source code and install required gems:

    git clone https://github.com/pchikoian/ITLearners.git
    cd train-schedule
    gem install bundler     # If you never installed bundler
    bundle install          # Install all required gems

Then you will need to change your database setting:

    cp config/database.yml.example config/database.yml
    vim config/database.yml

### Bootstrap the database

    rake db:create    # Create the databases (for development and test environments)
    rake db:migrate   # Run the migration script to update the database schema

### Start the web server

Execute:

    rails server

If everything goes right, the server will be available at http://localhost:3000

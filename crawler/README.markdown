# Train Schedule Crawler

## Dependencies

* Ruby 1.9.3
* Nokogiri

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

## Getting Started

First, check the dependency:

    gem install bundler     # If you never installed bundler
    bundle install          # Install all required gems

### Start the crawler

Execute:

    ruby main.rb

If everything goes right, all xml files are stored in './data/xml'.

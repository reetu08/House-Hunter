House Hunter
================

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).


Getting Started
-------------------------

Please check out the running application on Heroku [here](https://shielded-caverns-63027.herokuapp.com/).

Use email `admin@househunter.com` and password `househunteradmin` to access.

### Roles
Our system uses role-based authorization for user access. This means that a User can have either the House-Hunter and/or the Realtor role. When signing-up, you simply select which Roles you would like to have. If you sign-up with one, you can always add the other when you edit your account.

This means that there is not specific link for Realtor sign-up or House-Hunter sign-up. If you would like to test the isolated functionality of one roles, sign-up only with that Role.


Development
---------------

This application requires:

- Ruby 2.4.1 or higher
- Rails 5.2.1

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Once you have the necessary Ruby and Rails dependencies (see above), you will need to install the required Gems.

To do this, simply run
```
bundle install --without production
```

Once these have been installed, you will need to create and seed your development database.
```
rake db:migrate
rake db:seed
```

This will create your database in `db/development.sqlite3` and create the Admin user.

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------

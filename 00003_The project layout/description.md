`mumukit` also proposes you a particular folder structure that you are **strongly** encouraged to follow:

* your code goes in `lib`
* your `rspec` tests go in `spec`
* if you need a :whale: Dockefile - later, more on this topic - it goes in `worker`. 
* you must build your project as a gem, so you will need a `.gemspec` file
* and you will be required to start your runner using the `rackup` command, so you must provide a `config.ru` file

Although this is a fairly standard ruby project structure, `mumukit-bootstrap` creates it for you automatically, plus some initial hooks :smile:. See more [here](https://github.com/mumuki/mumukit-bootstrap).

> Quick check! You package your runners as...

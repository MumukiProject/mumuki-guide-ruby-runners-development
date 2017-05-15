Implementing a Docker `worker` is quite easy: 

1. Place your Dockerfile in `worker/`
2. Build it: `docker build .`
3. Tag it: `docker build -t <TAG> .`
4. Push it `docker push <TAG>`

Then register it in your `<runner>_runner.rb` file: 

```ruby
Mumukit.configure do |config|
  config.docker_image = 'mumuki/mumuki-<RUNNER>-worker'
end
```

If you have used `mumukit-bootstrap`'s `create.sh` script, we have already done it for you :wink:

But, what should contain your dockerfile? Simple put, it needs to provide a complete environment to run your technology and their tests. In other words, your docker container must be able to execute the command line returned by `command_line(filename)` in your `test_hook.rb`. 

For example, this is a `Dockerfile` that allows you to execute `ruby` + `rspec` technology:  

```Dockerfile
FROM ruby:2.2
MAINTAINER Franco Leonardo Bulgarelli
RUN gem install rspec --version '=3.5'
```

Simple, huh? :smile:

There are some cases where more work is involved. For example, there may not be a simple command to run your tests, like `rspec` or `mocha`, but a more complex sequence of steps that require code generation, compilation, creating a proper buildpath, etc. In those cases, a simple workaround is to build the command yourself, e.g. as bash script. See the following examples:

* https://github.com/mumuki/mumuki-java-runner/blob/master/worker/runjunit
* https://github.com/mumuki/mumuki-cpp-runner/blob/master/bin/runcppunit.sh

Then place this file in `worker/<CUSTOM_COMMAND>`, and add it to your Dockerfile:

```Dockerfile
...
COPY <CUSTOM_COMMAND> /bin/<CUSTOM_COMMAND>
RUN chmod u+x /bin/<CUSTOM_COMMAND>
```
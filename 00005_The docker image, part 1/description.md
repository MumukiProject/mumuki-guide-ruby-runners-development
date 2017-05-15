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

But, what should contain your dockerfile? Simple put, it needs to provide a complete environment to run your technology and their tests. In other words, your docker container must be able to execute the command line returned by `command_line(filename)` in your `test_hook.rb`. No other code will be run within it. 

For example, this is a `Dockerfile` that allows you to execute `ruby` + `rspec` technology:  

```Dockerfile
FROM ruby:2.2
MAINTAINER Mumuki Project
RUN gem install rspec --version '=3.5'
```

Simple, huh? :smile:

> Quick check! A docker image should have all the necessary to...


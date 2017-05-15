Also, be sure to keep the runner version updated in `lib/version_hook.rb`: 

```ruby
module YourRunnerVersionHook
  VERSION = '1.0.0'
end
```

It is important that you also require and use this version from your `.gemspec`. E.g.:

```ruby
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version_hook'

Gem::Specification.new do |spec|
  spec.name          = 'mumuki-cpp-runner'
  spec.version       =  CppVersionHook::VERSION
  # ...
end
```

> Your turn! Declare the `1.2.2` version of your `foobar` runner. 

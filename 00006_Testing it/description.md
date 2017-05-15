Now you are ready to start testing your runner! :tada:. Simply run: 

```bash
bundle exec rspec
```

This will run a default integration case in `spec/` directory. You can obviusly add more examples and specs. Please notice that all hooks are easy to unit test, too, since they expose a default constructor - you can just do `MyTestHook.new` and have no other dependencies, e.g:

```ruby
describe 'running' do
  let(:runner) { RubyTestHook.new }

  describe '#command_line' do
    it { expect(runner.command_line 'spec/data/sample.rb').to eq 'rspec spec/data/sample.rb'  }
  end
end
```

In addition, `mumukit-bootstrap` creates an integration test that actually boots the server and send HTTP to the server. This sounds awesome, but _don't drink to much cool aid_ - such integration tests are slow. 

> Quick check! Which kind of tests can you do when developing a runner?

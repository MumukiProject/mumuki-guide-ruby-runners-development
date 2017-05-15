Now you are ready to start testing your runner! :tada:. Simply run: 

```bash
bundle exec rspec
```

This will run a default integration case in `spec/` directory. You can obviusly add more examples and specs. Please notice that all hooks are easy to unit test, too, since they expose a default constructor - you can just do `MyTestHook.new` and have no other dependencies. 
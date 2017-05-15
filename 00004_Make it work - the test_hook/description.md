_The rest of this section will assume you are creating a runner for a technology that already provides a unit-test framwork, like `JUnit`, `rspec` o `hspec`._

After creating the project structure with `mumukit-bootstrap`, the first thing you should do it to implement the `test_hook`, located in `lib/test_hook.rb`. This will allow you to run tests for your technology in Mumuki Platform.

A simple `test_hook` will look like this:

```ruby
class YourRunnerTestHook < Mumukit::Templates::FileHook
  mashup
  isolated true

  def tempfile_extension
    '...'
  end

  def command_line(filename)
    "... #{filename}"
  end
end
```

A `test_hook` that inherits from `Mumukit::Templates::FileHook` - more on that later - has two main responsabilities:

* generate a test file that describes a self-contained test in the target techonology - for example, a `*_spec.rb` file in Ruby or a `*Test.java` in Java. It is important that the file must contain not only the test code provided by the teacher but also the code provided by the student.
  * The `mashup` directive, however, does this for you using simple defaults, so we don't have to care about this by now.
* execute that self-contained file using the technology's unit-test framework techonology. For example, the `rspec` command in Ruby makes the trick, and the `mocha` command does it in JavaScript.
  * The `isolated true` directive allows you to make this execution simple and secure, by running it within a Docker container.

Now, you have to do the following:

1. Implement `tempfile_extension`: return the extension for your test files. For example, for ruby it will be `'rb'`, and for java it will be `'java'`
2. Implement `command_line`: this method must return a command line that will be run within the previusly mentioned docker container. Some examples:

  1. Ruby:    `rspec #{filename}`
  2. Node:    `mocha #{filename}`
  3. Haskell: `runhaskell #{filename}`

Perhaps you are wondering _Java or C do not provide such commands for running tests_ :thought_balloon:. If that is the case, continue reading. 
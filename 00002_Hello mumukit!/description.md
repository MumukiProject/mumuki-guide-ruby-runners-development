Implementing a Runner from scratch is a complex task :cold_sweat: , that requires a deep understanding of the communcation protocol between the Mumuki Applications and the runners. Also, although each runner provides support for a specific technology - like Java, C, Ruby or HTML - there are common problems and solutions that are independent of it.

For that reason, we have created `mumukit` - notice the final `t` :wink:, a Ruby gems that allows you to easily implement runners in, err..., ruby :stuck_out_tongue:. It acts as an abstraction layer between the low-level implementation details and the runner's programmer.

`mumukit` is a framework, and is _hook-oriented_: you will have to implement specific classes called `hook`s in order to support specific runner features. Most of them are optional, which allows you to quickly implement a runner without much effort. However, in order to implement a full-fledged runner, you may need to do more work.

> Quick check! `mumukit` is...

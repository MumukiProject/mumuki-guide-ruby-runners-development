There are some cases where more work is involved. For example, there may not be a simple command to run your tests, like `rspec` or `mocha`, but a more complex sequence of steps that require code generation, compilation, creating a proper buildpath, etc. In those cases, a simple workaround is to build the command yourself, e.g. as bash script. See the following examples:

* https://github.com/mumuki/mumuki-java-runner/blob/master/worker/runjunit
* https://github.com/mumuki/mumuki-cpp-runner/blob/master/bin/runcppunit.sh

Then place this file in `worker/<CUSTOM_COMMAND>`, and add it to your Dockerfile:

```Dockerfile
...
COPY <CUSTOM_COMMAND> /bin/<CUSTOM_COMMAND>
RUN chmod u+x /bin/<CUSTOM_COMMAND>
```

> Quick check! Does `mumukit` allow you to run custom commands not provided by your techonology SDK? 
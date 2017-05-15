A runner is, simply put, an HTTP server that exposes a few routes:

* `POST /test`, which runs a mumuki test. The request contains both the code sent by the student and also the test code provided by the teacher.
* `POST /query`, which runs a mumuki query - think it as a line in a REPL
* `GET /info`, which exposes runner metadata to be able to discover it in a network and allow other tools to display information about it.

The Mumuki Platforms heavily depend on such runners, since all the Mumuki Applications delegate student's code execution to them. That allows them to remain agnostic about the supported technology details, and makes easy to add new technologies to the Platform.

Although the Mumuki Platform does not impose any restriction about how a Runner is implemented, you will normally implement a brand new runner for each technology you want to be support

> Quick check! A Mumuki Runner is...

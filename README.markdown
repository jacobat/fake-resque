FakeResque
==========

Don't want to have the resque infrastructure in place when developing or
testing your resque dependent applications? FakeResque will replace Resque
and execute any Resque calls synchronously instead of asynchronously.

Usage
-----

    require 'fake-resque'

    # That's it.

    # To use the real Resque

    FakeResque.deactivate!

    # To disable the real Resque again

    FakeResque.activate!

    # To drop messages being sent through Resque

    FakeResque.block!

    # To start sending messages again

    FakeResque.unblock!

    # Or

    FakeResque.activate!

Installation
------------

### [Gemcutter](http://gemcutter.org/)

    $ gem install fake-resque

Contributing
------------

Once you've made your great commits:

1. [Fork][0] FakeResque
2. Create a topic branch - `git checkout -b my_branch`
3. Push to your branch - `git push origin my_branch`
4. Create an [Issue][1] with a link to your branch
5. That's it!

Acknowledgements
----------------

Based on the [fakefs library][2] by defunkt.

Meta
----

* Code: `git clone git://github.com/jacobat/fake-resque.git`
* Home: <http://github.com/jacobat/fake-resque>
* Bugs: <http://github.com/jacobat/fake-resque/issues>
* Gems: <http://gemcutter.org/gems/fake-resque>

[0]: http://help.github.com/forking/
[1]: http://github.com/jacobat/fake-resque/issues
[2]: http://github.com/defunkt/fakefs
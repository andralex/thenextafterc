Examples
==============================================

D is a complex multi-paradigm programming language. At the same time, if you know C programming language and you want to start using D then you just need to look through some examples.


Hellow Wolrd!
~~~~~~~~~~~~~~
    
C programs can be easily translated to D.
The following program prints "Hello, World!" to the standard output.

.. literalinclude:: ../../examples/helloworld.c
    :language: c
    :tab-width: 4 


D `doesn't have a preprocessor <http://dlang.org/pretod.html>`_.
Use ``import core.stdc.MODULE;`` construction to import ``MODULE`` from the `C Standard library`_.

.. literalinclude:: ../../examples/helloworld1.d
    :language: d
    :tab-width: 4

Module ``core.stdc.stdio`` contains the ``puts`` prototype: 

.. code-block:: d

    extern(C) @system nothrow @nogc int puts(in char* s);

Common D "Hello, World!" program which is based on Phobos looks more simple:

.. literalinclude:: ../../examples/helloworld2.d
    :language: d
    :tab-width: 4	

Phobos_ is the standard runtime library that comes with the D language compiler.

.. seealso:: To find a collection of common C techniques, and to find out how to do the corresponding task in D click `here  <http://dlang.org/ctod.html>`_. However most of them can be implemented in C style.

.. _D: http://dlang.org
.. _C Standard library: http://www.cplusplus.com/reference/clibrary/
.. _Phobos: http://dlang.org/phobos/


Simple project with dub
~~~~~~~~~~~~~~~~~~~~~~~

DUB_ is a build tool for D projects with support for automatically retrieving dependencies and integrating them in the build process. The design emphasis is on maximum simplicity for simple projects, while providing the opportunity to customize things when needed.

.. _DUB: http://code.dlang.org/getting_started

Plotting with matplotlib (python)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These are two projects that can be used with the D programming language:

	+ Plotcli_ is a command line application written in D that can create plots from text/csv files and from piped data, making it useful during data analysis.
	+ PLplot_ is a cross-platform software package written in C for creating scientific plots. It includes low-level D bindings.

But these two are not so convenient to use, in comparison with matplotlib.

matplotlib_ is a python 2D plotting library which produces publication quality figures in a variety of hardcopy formats and interactive environments across platforms. matplotlib can be used in python scripts, the python and ipython shell, web application servers, and different graphical user interface toolkits. To integrate with python the PyD package can be used.

PyD_ is a library that provides seamless interoperability between the D programming language and Python.
The minimal configuration file for this example is

.. literalinclude:: ../../examples/matplotlib/dub.json
    :language: json
    :tab-width: 4

.. note:: The python should be `installed <https://www.python.org/downloads/>`_. PyD searches the version of the python that is noted in the sub-configuration (``"pyd": "python34"`` in this example). For more information, see `the PyD's dub configuration file <https://github.com/ariovistus/pyd/blob/master/dub.json>`_.

The `following program <https://github.com/9il/thenextafterc/tree/master/examples/matplotlib>`_
reads data from a file and shows the histogram.

.. literalinclude:: ../../examples/matplotlib/source/app.d
    :language: d
    :tab-width: 4

.. image:: /img/hist.png
    :alt: Histogram image

.. _matplotlib: http://matplotlib.org
.. _Plotcli: https://github.com/BlackEdder/plotd
.. _PyD: http://pyd.readthedocs.org
.. _PLplot: http://plplot.sourceforge.net

Web Application
~~~~~~~~~~~~~~~

Web application is a pretty good example of the last chapters of the book, where the reader is suggested to make use of the means of expression in the language. As a rule, web application is a complex product, both in terms of knowledge of the language and in terms of complexity used in this library.

And this example is no exception. Then why do people who want to learn this language very quickly have a need in it? Many of them have a reason and it is that they need to integrate quickly programs written in D with other services, programming languages and databases. 

The article "`Creating a simple restful web app with node.js, Express, and MongoDB <http://cwbuecheler.com/web/tutorials/2014/restful-web-app-node-express-mongodb/>`_" by Christopher Buecheler is taken as a basis for this example.


Initialization
^^^^^^^^^^^^^^^

To create a skeleton web application, run:

.. code-block:: shell

    $ dub vibed-mongo vibe.d

This will make in directory ``vibed-mongo`` with a minimal HTTP server based on vibe.d.

The configuration file ``dub.json`` will look something like this:

.. literalinclude:: ../../examples/vibed-mongo/dub.json
    :language: json
    :tab-width: 4

The version ``"VibeDefaultMain"`` includes the main function defined by default.

The project has the following structure:

.. code-block:: text

    dub.json            - package information
    source/             - D source code
        app.d
        service.d
    views/              - Diet templates
        index.dt
        layout.dt
    public/             - static directories
        javascripts/
            global.js
        styles
            style.css
        favicon.ico

After installing MongoDB run Mongo servers

.. code-block:: shell

    $ mongod


In another console run Mongo console

.. code-block:: shell

    $ mongo
    > use vibed
    switched to db vibed
    > db.createCollection("userlist", {autoIndexID : true})
    { "ok" : 1 }
    > db.userlist.insert({
        'username' : 'test1',
        'email' : 'test1@test.com',
        'fullname' : 'Bob Smith',
        'age' : 27,
        'location' : 'San Francisco',
        'gender' : 'male'
        })
    WriteResult({ "nInserted" : 1 })
    > exit
    bye

The script above will create a ``vibed`` database with a ``userlist`` collection, which will contain one record.

Patches
^^^^^^^^^

Comparing with the original article ``global.js`` was slightly changed:

.. literalinclude:: ../../examples/vibed-mongo/public/javascripts/global.js
    :language: js
    :tab-width: 4
    :lines: 96-107

.. literalinclude:: ../../examples/vibed-mongo/public/javascripts/global.js
    :language: js
    :tab-width: 4
    :lines: 129-138

Service
^^^^^^^^^^^^^

``vibe.d`` is a good example of the use of declarative programming with D. 
Service performs an ``insert``, ``select`` and ``remove`` operations for user entries at a mongo collection.

.. literalinclude:: ../../examples/vibed-mongo/source/service.d
    :language: d
    :tab-width: 4

App
^^^^^^^^^^^^^

Following static constructor connects ``vebid`` MongoDB, creates vibe.d server and implements an error handler.

.. literalinclude:: ../../examples/vibed-mongo/source/app.d
    :language: d
    :tab-width: 4

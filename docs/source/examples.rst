Examples
==============================================

NOT READY!

D is complex multi-paradigm programming language. At the same time, if you know С programming language, to start using D you just need to look through some examples. 

Hellow Wolrd!
~~~~~~~~~~~~~~

C programs can be easily translated to D.
The following program prints "Hello, World!" to the standard output.

.. literalinclude:: ../../examples/helloworld.c
    :language: c
    :tab-width: 4 


D `doesn't have a preprocessor <http://dlang.org/pretod.html>`_.
Use ``import core.stdc.MODULE;`` construction to import ``MODULE`` from `C Standard library`_.

.. literalinclude:: ../../examples/helloworld1.d
    :language: d
    :tab-width: 4

Module ``core.stdc.stdio`` contains the ``puts`` prototype: 

.. code-block:: d

    extern(C) @system nothrow @nogc int puts(in char* s);

Common D "Hello, World!" program based on Phobos_ looks more simple:

.. literalinclude:: ../../examples/helloworld2.d
    :language: d
    :tab-width: 4	

Phobos is the standard runtime library that comes with the D language compiler.

.. seealso:: To find a collection of common C techniques, and to find out how to do the corresponding task in D click `here  <http://dlang.org/ctod.html>`_. However most of them can be implemented in C style.

.. _D: http://dlang.org
.. _C Standard library: http://www.cplusplus.com/reference/clibrary/
.. _Phobos: http://dlang.org/phobos/

Plotting with matplotlib (python)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are two projects can be used with the D programming language:

	+ Plotcli_ is a command line application written in D that can create plots from text/csv files and from piped data, making it useful during data analysis.
	+ PLplot_ is a cross-platform software package written in С for creating scientific plots. It includes low-level D bindings.

But these two are not so convenient to use, in comparison with matplotlib.

matplotlib_ is a python 2D plotting library which produces publication quality figures in a variety of hardcopy formats and interactive environments across platforms. matplotlib can be used in python scripts, the python and ipython shell, web application servers, and different graphical user interface toolkits. To integrate with python the PyD package can be used.

PyD_ is a library that provides seamless interoperability between the D programming language and Python.
The minimal configuration file for this example is

.. literalinclude:: ../../examples/matplotlib/dub.json
    :language: json
    :tab-width: 4

.. note:: The python should be `installed <https://www.python.org/downloads/>`_. PyD searches the version of the python that noted in the PyD's sub-configuration (``"pyd": "python34"`` in this example). For more information, see `the PyD's dub configuration file <https://github.com/ariovistus/pyd/blob/master/dub.json>`_.

The `following program <https://github.com/9il/thenextafterc/tree/master/examples/matplotlib>`_
reads data from file and shows a histogram.

.. literalinclude:: ../../examples/matplotlib/source/app.d
    :language: d
    :tab-width: 4

.. image:: /images/hist.png
    :alt: Histogram image

.. _matplotlib: http://matplotlib.org
.. _Plotcli: https://github.com/BlackEdder/plotd
.. _PyD: http://pyd.readthedocs.org
.. _PLplot: http://plplot.sourceforge.net

Web Application
~~~~~~~~~~~~~~~

Various Build Systems
~~~~~~~~~~~~~~~~~~~~~~~

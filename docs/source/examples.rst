Examples
==============================================

NOT READY!

D is complex multi-paradigm programming language.
В тоже время, если Вы знаете С, чтобы начать использовать D потребуется 
всего навсего посмотреть несколько примеров.

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

Plotting
~~~~~~~~

Web Application
~~~~~~~~~~~~~~~

Various Build Systems
~~~~~~~~~~~~~~~~~~~~~~~

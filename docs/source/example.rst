Examples
==============================================

NOT READY!

D is complex multi-paradigm programming language.
В тоже время, если Вы знаете С, чтобы начать использовать D потребуется 
всего навсего посмотреть несколько примеров.

Hellow Wolrd!
~~~~~~~~~~~~~~

C programs can be easily translated to D.
The following program prints "Hello, World!" to the standard output.

.. literalinclude:: ../../examples/helloworld.c
    :language: c
    :tab-width: 4 


D `doesn't have a preprocessor <http://dlang.org/pretod.html>`_.
Use ``import core.stdc.MODULE;`` construction to import ``MODULE`` from `C Standard library`_.
Module ``core.stdc.stdio`` contains the ``puts`` prototype: 

.. code-block:: d

    extern(C) @system nothrow @nogc int puts(in char* s);


.. literalinclude:: ../../examples/helloworld1.d
    :language: d
    :tab-width: 4


Common D "Hello, World!" program based on Phobos_ looks simpler:

.. literalinclude:: ../../examples/helloworld2.d
    :language: d
    :tab-width: 4	

Phobos is the standard runtime library that comes with the D language compiler.

.. seealso:: A collection of common C techniques, and how to do the corresponding task in D can be found `here  <http://dlang.org/ctod.html>`_. However most of them can be implemented in C style.

.. _D: http://dlang.org
.. _C Standard library: http://www.cplusplus.com/reference/clibrary/
.. _Phobos: http://dlang.org/phobos/

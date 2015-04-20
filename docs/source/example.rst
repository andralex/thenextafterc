Examples
==============================================

NOT READY!

D_ is complex multi-paradigm programming language.
В тоже время, если Вы знаете С, чтобы начать использовать D потребуется 
всего навсего посмотреть несколько примеров.

Hellow Wolrd!
~~~~~~~~~~~~~~

To import ``MODULE`` from `C Standard library`_ use ``import core.stdc.MODULE;`` construction.

The following well known С program prints "Hello, World!" to the standard output.

.. literalinclude:: ../../examples/helloworld.c
    :language: c
    :tab-width: 4 

It can be easily translated to D_:

.. literalinclude:: ../../examples/helloworld1.d
    :language: d
    :tab-width: 4

.. seealso:: `Programming in D for C Programmers`_.


Phobos_ based "Hello, World!" program looks simpler:

.. literalinclude:: ../../examples/helloworld2.d
    :language: d
    :tab-width: 4

Phobos_ is the standard runtime library that comes with the D language compiler.

.. _D: http://dlang.org
.. _Programming in D for C Programmers: http://dlang.org/ctod.html
.. _C Standard library: http://www.cplusplus.com/reference/clibrary/
.. _Phobos: http://dlang.org/phobos/

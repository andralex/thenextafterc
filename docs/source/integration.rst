Integration with other languages
==============================================

C and friends
-------------

D that `has <http://dlang.org/interfaceToC.html>`_ full support for C ABI [#ABI]_ had recently been significantly improved for `interfacing with C++ <http://dlang.org/cpp_interface.html>`_  (however there is no support for C++ exceptions). Jacob Carlborg did a great job of integrating with Objective-C, which is still waiting to be no less grandiose review by Walter Bright.

Scripting languages
-------------------

You are already somehow familiar with the integration of scripting languages on the `example <examples.html#plotting-with-matplotlib-python>`_ of the use of the matplotlib library and `PyD <https://github.com/ariovistus/pyd>`_. Since most of them have a C API [#API]_, their integration with D can be performed without problems.

There is a `realization <https://github.com/DigitalMars/DMDScript>`_ of the ECMA 262 (Javascript) programming language written by Walter Bright and updated by Dmitry Olshansky.

It is also worth mentioning the Lua programming language. Unlike many other libraries built on the Lua C API, `LuaD <https://github.com/JakobOvrum/LuaD>`_ does not expose the Lua stack - instead, it has wrappers for references to Lua objects, and supports seamlessly and directly converting any D type into a Lua type and vice versa.

.. [#API] Application Programming Interface
.. [#ABI] Application Binary Interface

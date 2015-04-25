Integration with other languages
==============================================

C and friends
-------------

D that has full support for C ABI (application binary interface) had recently been significantly improved from C++ ABI [#ABI]_ (however it's worth noting that there is no support for exceptions). Jacob Carlborg did a great job of integrating with Objective-C, which is still waiting to be no less grandiose Review by Walter Bright.

Scripting languages
-------------------

You are already somehow familiar with the integration of scripting languages on the example of the use of the library matplotlib (python). Since most of them have a C API [#API]_, their integration with D can be performed without problems.

There is a realization of the ECMA 262 (Javascript) programming language written by Walter Bright and updated by Dmitry Olshansky.

It is also worth mentioning a popular computer games scripting language Lua. Unlike many other libraries built on the Lua C API, LuaD does not expose the Lua stack - instead, it has wrappers for references to Lua objects, and supports seamlessly and directly converting any D type into a Lua type and vice versa

.. [#API] Application Programming Interface
.. [#ABI] Application Binary Interface

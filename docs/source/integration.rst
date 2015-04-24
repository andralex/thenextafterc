Integration with other languages
==============================================

C and friends
-------------

D имеет полную поддержку C ABI (application binary interface) 
недавно был значительно улучшен С++ ABI [#ABI]_
(одноко стоит заметить, что нет поддержки исключений).
Jacob Carlborg проделал огромнейшую работу по интеграции с Objective-C,
которая пока ожидает своего не менее грандиозного ревью от Walter Bright.

Scripting languages
-------------------

С интеграцией со скриптовыми языками Вы уже немного знакомы на примере использования библиотеки matplotlib (python).
Так как большинство из них имеют C API [#API]_, то их интеграция с D может быть выполнена без
особых проблем. 

Имеется реалиазация the ECMA 262 (Javascript) programming language
написанная Walter Bright и обновленная Dmitry Olshansky.

Также стоит отметить про популярный в компьютерных играх скриптовой язык Lua. Unlike many other libraries built on the Lua C API, LuaD doesn't expose the Lua stack - instead, it has wrappers for references to Lua objects, and supports seamlessly and directly converting any D type into a Lua type and vice versa. 


.. [#API] Application Programming Interface
.. [#ABI] Application Binary Interface


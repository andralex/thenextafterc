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
Use ``import core.stdc.MODULE;`` construction to import ``MODULE`` from the `C Standard library`_.

.. literalinclude:: ../../examples/helloworld1.d
    :language: d
    :tab-width: 4

Module ``core.stdc.stdio`` contains the ``puts`` prototype: 

.. code-block:: d

    extern(C) @system nothrow @nogc int puts(in char* s);

Common D "Hello, World!" program based on Phobos looks more simple:

.. literalinclude:: ../../examples/helloworld2.d
    :language: d
    :tab-width: 4	

Phobos_ is the standard runtime library that comes with the D language compiler.

.. seealso:: To find a collection of common C techniques, and to find out how to do the corresponding task in D click `here  <http://dlang.org/ctod.html>`_. However most of them can be implemented in C style.

.. _D: http://dlang.org
.. _C Standard library: http://www.cplusplus.com/reference/clibrary/
.. _Phobos: http://dlang.org/phobos/


Build System
~~~~~~~~~~~~~~~~~~~~~~~

Plotting with matplotlib (python)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These are two projects that can be used with the D programming language:

	+ Plotcli_ is a command line application written in D that can create plots from text/csv files and from piped data, making it useful during data analysis.
	+ PLplot_ is a cross-platform software package written in С for creating scientific plots. It includes low-level D bindings.

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

Web application это довольно хороший пример для последних глав
книги, где читателю предлагается вполной мере воспользоваться средствами
выразительности языка. То есть, как правило, web application
представляет из себя сложный продукт, как с точки зрения
знания языка, так и с точки зрения сложности используемых при этом библиотек 
(тут наверное не стоит дословно переводить).

И данный пример не является исключением. Тогда зачем он нужен людям желающим
предельно быстро ознакомитсься с языком? Для многих из них, такая причина есть,
и заклюяается она в том, что им необходимо быстро интегрировать 
программы написанные на D с другими сервисами, языками программирования и базами данных.

В качестве основы для данного примера взята статья
"Сreating a simple restful web app with node.js, Express, and MongoDB"
By Christopher Buecheler.

.. В качестве is a D pacakge for easily building fast, productive network applications.

.. Далее представлена краткая инструкция

Initialization
^^^^^^^^^^^^^^^

Для создания скелета веб приложения запустите

.. code-block:: shell

    $ dub vibed-mongo vibe.d

Эта команда создаст minimal HTTP server based on vibe.d в папке ``vibed-mongo``.

Конфигурационный файл ``dub.json`` будет выглядеть примерно следующим образом 

.. literalinclude:: ../../examples/vibed-mongo/dub.json
    :language: json
    :tab-width: 4
    :name: dub.json
    :caption: dub.json

Версия ``"VibeDefaultMain"`` включает в проект функцию ``main`` определенную
по умолчанию.

Структура файлов ``vibed-mongo`` имеет следующую структуру:


После установки MongoDB запустите его

.. code-block:: shell

    $ mongod

В другой консоле выполнете

.. code-block:: shell

    $ mongod
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

Команда создаст базу данных ``vibed`` с коллекций ``userlist``,
в которой будет одна запись.

Patches
^^^^^^^^^

В сравнении с исходной статьей незначительно был измененен `global.js`:

.. literalinclude:: ../../examples/vibed-mongo/public/javascripts/global.js
    :language: js
    :tab-width: 4
    :lines: 96-107
    :lineno-start: 96

.. literalinclude:: ../../examples/vibed-mongo/public/javascripts/global.js
    :language: js
    :tab-width: 4
    :lines: 129-138
    :lineno-start: 129


Service
^^^^^^^^^^^^^

vibe.d является хорошим примером использования декларативного программирования на (with?) D.
Сервис реализует добавление в базу и удаление из базы записей о пользователях.

.. literalinclude:: ../../examples/vibed-mongo/source/service.d
    :language: d
    :tab-width: 4

App
^^^^^^^^^^^^^

Осталось подключить MongoDB, инициализировать сервер и реализовать обработчик ошибок.

.. literalinclude:: ../../examples/vibed-mongo/source/app.d
    :language: d
    :tab-width: 4

Introduction
================

It was mentioned that students can quickly master the D programming language without a detailed study using mostly its subset, which is close to the C PL. 

Рассмотрим простую программу, которая считывает из файла 10 строк, содержащих по одному числу и
печатает в стандартный выход эти же числа, но сдвинутые на математическое ожидание.

Тогда как идиоматический D код выглядет достаточно непревычно:

.. literalinclude:: ../../examples/readdoubles2.d
    :language: d
    :tab-width: 4

для многих незнакомых с языком D та же самая программа может быть реализована хоть и более грамоздким,
но в тоже время более понятным способом:

.. literalinclude:: ../../examples/readdoubles1.d
    :language: d
    :tab-width: 4

The present documentation is submitted to the rapid introduction to D for those who are already somehow familiar with the C language and for some reasons do not want to waste time on a consistent study of the D language and related tools.

If you decide to use the D language in your daily work, you should start immediately with the study of the  `official page <http://dlang.org>`_ and of the book `"The D Programming Language" <http://erdani.com/index.php/books/tdpl/>`_ by Andrei Alexandrescu.

Probably D is the most powerful of the present `system programming languages <http://en.wikipedia.org/wiki/System_programming_language>`_.
`It is a dragon <http://thebird.nl/blog/D_Dragon.html>`_. Have a nice flight!

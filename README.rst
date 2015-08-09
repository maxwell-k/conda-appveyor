A way to install vim_ on Windows using conda_, specifically install a
version of ``gvim`` on Windows 7 that is compatible with vim-ipython_.


.. image:: https://ci.appveyor.com/api/projects/status/
   abym5u9rxjrsj2fx?svg=true
   :width: 300 px

.. _vim: http://www.vim.org
.. _conda: http://conda.pydata.org
.. _vim-ipython: https://github.com/ivanov/vim-ipython

Notes
=====

-   Remove any existing versions of Python **first**
-   Generally doesn't require local administrator rights
-   AVG causes an issue which requires local administrator rights
-   Installs into ``%USERPROFILE%\Miniconda3`` or
    ``%USERPROFILE%\AppData\Local\Coninuum\Miniconda3``
-   ``cmd`` lines in ``appveyor.yml`` are treated as batch files, so double
    percent signs: ``%%i`` not ``%i``
-   ``cmd.exe`` shell doesn't support wild-card expansion, applications have to
-   ``README.md`` or ``README.rst`` as a link to ``README`` won't work on FAT
    file-systems
-   Encrypt data from the account menu or using
    https://ci.appveyor.com/tools/encrypt
-   Create an authentication token with::

        rem Login with password:
        anaconda login
        rem Show current user information:
        anaconda whoami
        rem List tokens:
        anaconda auth -l
        rem Remove a token:
        anaconda auth -r <name>
        rem Show help:
        anaconda auth -h
        rem Create a token named appveyor:
        anaconda auth -n appveyor --create --out token.txt
        rem Different scopes can be specified with -x

Steps
=====

1.  Install a Windows 64 bit, Python 3.4 version of Miniconda_ using all of
    the default options.

2.  Update `conda` and  install packages::

        conda update conda
        conda install ipython pyzmq flake8 xlrd
        conda install -c maxwell-k winshell

.. _Miniconda: http://conda.pydata.org/miniconda.html

Checks
======

1.  Check that we're using the right version of Python. The
    following two commands should output the same version number::

        conda list python
        python --version

2.  Check that communication with an existing kernel works using::

        ipython console
        In  [1]: a = 2

    Then in a separate console::

        ipython console --existing
        In  [1]: a
        Out [1]: 2

References
==========

-   | Why I promote conda, Travis Oliphant
    | http://technicaldiscovery.blogspot.co.uk/2013/12/why-i-promote-conda.html
-   | Build and test recipes for conda, Conda organisation
    | https://github.com/conda/conda-recipes
-   | Percent signs stripped from batch file text, Microsoft
    | https://support.microsoft.com/en-us/kb/75634
-   | appveyor.yml reference, AppVeyor
    | http://www.appveyor.com/docs/appveyor-yml

.. vim: ft=rst

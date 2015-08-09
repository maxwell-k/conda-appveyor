A way to install vim_ on Windows using conda_, specifically install a
version of ``gvim`` on Windows 7 that is compatible with vim-ipython_.

.. image:: https://ci.appveyor.com/api/projects/status/
   abym5u9rxjrsj2fx?svg=true
   :width: 300 px

.. _vim: http://www.vim.org
.. _conda: http://conda.pydata.org
.. _vim-ipython: https://github.com/ivanov/vim-ipython

Windows
=======

1.  Either Install a Windows 64 bit, Python 3.4 version of Miniconda_ using
    all of the default options, or download and run the script::

        curl -O https://repo.continuum.io/miniconda/\
        Miniconda3-latest-Linux-x86_64.sh &&
        bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3 &&
        export PATH=/opt/miniconda3/bin:$PATH

    The install folder must support symbolic links.

2.  Update `conda` and  install packages::

        conda update conda --yes
        conda install jinja2 flake8 xlrd --yes
        conda install -c maxwell-k google-api-client --yes
        # windows only
        conda install -c maxwell-k winshell ipython pyzmq

3.  If building and uploading packages on this machine::

        conda install anaconda-client conda-build --yes
        anaconda login
        anaconda whoami

.. _Miniconda: http://conda.pydata.org/miniconda.html

Notes
=====

-   Remove any existing versions of Python **first**
-   On Windows, generally doesn't require local administrator rights
-   AVG causes an issue which does require local administrator rights
-   Installs into ``%USERPROFILE%\Miniconda3`` or
    ``%USERPROFILE%\AppData\Local\Coninuum\Miniconda3``
-   The download is extracted to ``%ROOT%\conda-bld\work``
-   The build as compressed into the package is in ``%ROOT%\envs\_build``
-   ``cmd`` lines in ``appveyor.yml`` are treated as batch files, so double
    percent signs: ``%%i`` not ``%i``
-   ``cmd.exe`` shell doesn't support wild-card expansion, applications have to
-   ``README.md`` or ``README.rst`` as a link to ``README`` won't work on FAT
    file-systems
-   Encrypt data from the account menu or using
    https://ci.appveyor.com/tools/encrypt
-   Manage authentication tokens:

    =================== =====================================================
    Action              Command
    =================== =====================================================
    List tokens         ``anaconda auth -l``
    Remove a token      ``anaconda auth -r <name>``
    Show help           ``anaconda auth -h``
    Create a token      ``anaconda auth -n <name> --create --out token.txt``
    =================== =====================================================

    Different scopes can be specified with ``-x``.

-   Build scripts inside `meta.yaml` don't work on Windows
    http://conda.pydata.org/docs/building/meta-yaml.html#script

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
-   | Conda Environment Variables
    | http://conda.pydata.org/docs/building/environment-vars.html

.. vim: ft=rst

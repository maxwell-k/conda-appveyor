# Environment

A way to install `vim` on Windows using `conda`, specifically install a
version of `gvim` on Windows that is compatible with `vim-ipython`.

## Notes

-   Remove any existing versions of Python **_first_**
-   Generally doesn't require local administrator rights
-   AVG causes an issue which requires local administrator rights
-   Installs into `%USERPROFILE%\Miniconda3` or
    `%USERPROFILE%\AppData\Local\Coninuum\Miniconda3`


## Steps

1.  Install a Windows 64 bit, Python 3.4 version of
    [Miniconda](http://conda.pydata.org/miniconda.html) using all of the
    default options.

2.  Update `conda` and  install packages:

        conda update conda
        conda install ipython pyzmq flake8 xlrd
        conda install -c maxwell-k winshell

## Checks

1.  Check that we're using the right version of Python. The
    following two commands should output the same version number:

        conda list python
        python --version

2.  Check that communication with an existing kernel works:

        ipython console
        In  [1]: a = 2

    and in a separate console:

        ipython console --existing
        In  [1]: a
        Out [1]: 2

# References

-   http://technicaldiscovery.blogspot.co.uk/2013/12/why-i-promote-conda.html

<!-- vim: set ft=markdown: -->

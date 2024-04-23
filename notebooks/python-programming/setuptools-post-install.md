# post install script

run a custom script/function after installoing a python package using setuptools

!!! note
    The solution below only works when installing a source distribution zip or tarball, or installing in editable mode from a source tree.
    It will not work when installing from a binary wheel (.whl)
 
you need to consider two different post-installations
one for development/editable mode and the other one for install mode
```python
from setuptools import setup
from setuptools.command.develop import develop
from setuptools.command.install import install


class PostDevelopCommand(develop):
    """Post-installation for development mode."""
    def run(self):
        develop.run(self)
        # PUT YOUR POST-INSTALL SCRIPT HERE or CALL A FUNCTION

class PostInstallCommand(install):
    """Post-installation for installation mode."""
    def run(self):
        install.run(self)
        # PUT YOUR POST-INSTALL SCRIPT HERE or CALL A FUNCTION

setup(
    ...

    cmdclass={
        'develop': PostDevelopCommand,
        'install': PostInstallCommand,
    },

    ...
)
```

Source:
https://stackoverflow.com/questions/20288711/post-install-script-with-python-setuptools

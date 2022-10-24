# Nix Flake–based templates for Python projects


The default template is a simple Python project where all dependencies are
assumed to be provided via Nix. You can create a new project based on that
template by running


```bash
nix flake new my-project -t github:dpaetzel/templates --refresh
```


Note that there are several things marked with TODO in the generated files where
you will have to enter the corresponding information (e.g. author's name,
package name etc.).


Use the `python-venv` template if there are dependencies that you want to
install via a Python venv:


```bash
nix flake new my-project -t github:dpaetzel/templates#python-venv --refresh
```


# TODO


- Add template including TensorFlow with GPU support

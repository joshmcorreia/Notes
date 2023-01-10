# Python3

# Virtual Environments

Virtual environments are important because they allow you to install packages without interfering with global packages. If you need to use an updated version of a library you can install it in a virtual environment instead of updating the package globally which can break other libraries that depend on that package.

## Creating a virtual environment:
[Source](https://docs.python.org/3/library/venv.html#creating-virtual-environments)
```
python3 -m venv /home/josh/venv_test
```

## Activating a virtual environment:
```
source venv_test/bin/activate
```

## Deactivating a virtual environment:
```
deactivate
```

## Print the python version
```
python --version
```

## List packages installed in a virtual environment:
```
pip list
```

## Save a venv for installation on another computer:
```
pip freeze > requirements.txt
```

## Load a venv from a requirements file:
```
pip install -r requirements.txt
```

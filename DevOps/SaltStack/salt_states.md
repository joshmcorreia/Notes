# Salt States
[Documentation](https://docs.saltproject.io/salt/user-guide/en/latest/topics/states.html)

---

## What are Salt states?
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/states.html#overview-of-salt-states)

Salt states are used to deploy and manage infrastructure and to allow automation of recursive and predictable tasks.

For example, Salt states are great when you need to install a package on a fleet of machines. The state file can specify the package to be installed and can copy the configuration file over once the installation is complete.

---

## The state SLS data structure
[Source](https://docs.saltproject.io/salt/user-guide/en/latest/topics/states.html#the-state-sls-data-structure)

A state definition in a state file will have the following components:
- **Identifier** is the identifier declaration for the state section.
- **State** is the name of the `state` module containing the function, such as `pkg`.
- **Function** is the function to call in the named module, such as `installed`.
- **Name** is the name of the state call, which is usually the name of the file to be managed or the name of the package to be installed.
- **Arguments** are the arguments that the state function will accept.

Example:
```
# /srv/salt/example.sls

identifier:
  module.function:
    - name: name_value
    - function_arg: arg_value
    - function_arg: arg_value
    - function_arg: arg_value
```

---

## Calling an execution module from within a salt state
[Source](https://stackoverflow.com/a/20788572)

To call an execution module from within a salt state you need to use `module.run`. In the following example I am calling the `ps.psaux` module to see if `tmux` is currently running. `m_name` stands for `module name` and denotes the value that is passed into the module.

Example:
```
check_tmux:
  module.run:
    - name: ps.psaux
    - m_name: tmux
```

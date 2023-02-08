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

---

## Copy a file to a minion
[Source](https://docs.saltproject.io/en/latest/ref/states/all/salt.states.file.html#salt.states.file.managed)
```
copy_delete_script:
  file.managed:
    - name: /home/ubuntu/delete_stuff.py
    - source: salt://scripts/delete_stuff.py
    - user: ubuntu
```

The `source` field here is based on the `file_roots` configuration on the Salt Master. By default the Salt Master's `file_roots` is set to `/srv/salt` so this file exists on the Salt Master at `/srv/salt/scripts/delete_stuff.py`

---

## Execute a Python script on a minion
[Source](https://archive.repo.saltproject.io/en/2017.7/ref/states/all/salt.states.cmd.html#salt.states.cmd.run)
```
run_delete_stuff_script:
  cmd.run:
    - name: python3 delete_stuff.py
    - cwd: /home/ubuntu
    - timeout: 10
    - runas: ubuntu
```
This piggybacks off of the prior section, "Copy a file to a minion". Combining these two sections, you are able to copy a file to a minion and then execute it.

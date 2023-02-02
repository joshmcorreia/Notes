# Jinja

## Debugging Jinja
[How to examine Jinja output in Saltstack?](https://devops.stackexchange.com/questions/1156/how-to-examine-jinja-output-in-saltstack)

Using the SaltStack renderer you are able to print out what the template file would look like when executed on a specific minion. This makes it easy to debug a state file without having to apply it to the minion.

Example:
```
sudo salt my_minion_id slsutil.renderer salt://my_state_file.sls 'jinja'
```

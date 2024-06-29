# Removing an agent on Docker
```
$ docker exec -it {wazuh_manager_container_id} bash
root@wazuh:/# /var/ossec/bin/manage_agents

****************************************
* Wazuh v4.7.5 Agent manager.          *
* The following options are available: *
****************************************
   (A)dd an agent (A).
   (E)xtract key for an agent (E).
   (L)ist already added agents (L).
   (R)emove an agent (R).
   (Q)uit.
Choose your action: A,E,L,R or Q: r
ID: 002, Name: fake_agent, IP: any
Provide the ID of the agent to be removed (or '\q' to quit): 002
Confirm deleting it?(y/n): y
Agent '002' removed.
```

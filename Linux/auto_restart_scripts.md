# Auto Restarting Scripts
Sometimes you have scripts that aren't daemonized that need to automatically restart upon failure or completion. There is a great [post about this on StackOverflow](https://stackoverflow.com/questions/696839/how-do-i-write-a-bash-script-to-restart-a-process-if-it-dies), but I'm going to highlight the best answers below.

### Auto-restart on failure:
This will allow a bash script to automatically restart if a script exits with a non-zero return code.
``` bash
#!/bin/bash
until java -jar minecraft_server.jar nogui; do
  echo "Server stopped with exit code '$?'... Restarting in 30 seconds"
  sleep 30
done
```

### Auto-restart on exit:
This will allow a bash script to automatically restart upon exit, regardless of the return code. Note that this can be a little difficult to deal with because the script will restart even when you intentionally shut it down. I've found that the only way to stop the script is by sending a signal to the process that runs the below wrapper script.
``` bash
#!/bin/bash
while true; do
  java -jar minecraft_server.jar nogui
  echo "Server stopped with exit code '$?'... Restarting in 30 seconds"
  sleep 30
done
```

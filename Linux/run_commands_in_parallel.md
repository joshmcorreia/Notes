## Running commands in parallel:
To accomplish running multiple commands in parallel in the terminal, you're able to chain together the `&` operator which sends commands to the background. In the following example, you can see that both commands finish in 5 seconds instead of 10 seconds.
```
sleep 5 & sleep 5 &
```

Here's an example that makes it clear that both commands execute at the same time:
```
(sleep 5 && echo "hello1") & (sleep 5 && echo "hello2") &
```

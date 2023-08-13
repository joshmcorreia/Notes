# ThreadPoolExecutor

## Stop all future threads from running if an exception occurs in one of them:
``` python
import concurrent.futures
import time

def sleep_test(order_number):
	num_seconds = 0.5
	print(f"Order {order_number} - Sleeping {num_seconds} seconds")
	time.sleep(num_seconds)
	print(f"Order {order_number} - Slept {num_seconds} seconds")
	if order_number == 4:
		raise Exception("Reached order #4")

def main():
	order_numbers = [i for i in range(10_000)]
	max_number_of_threads = 2

	with concurrent.futures.ThreadPoolExecutor(max_workers=max_number_of_threads) as executor:
		futures = []
		for order in order_numbers:
			futures.append(executor.submit(sleep_test, order_number=order))

		for future in futures:
			if future.cancelled():
				continue
			try:
				_ = future.result()
			except Exception:
				print("Caught Exception, stopping all future orders")
				executor.shutdown(wait=False, cancel_futures=True)

if __name__ == "__main__":
	main()
```
Sample execution:
```
$ python3 thread_pool_test.py
Order 0 - Sleeping 0.5 seconds
Order 1 - Sleeping 0.5 seconds
Order 0 - Slept 0.5 seconds
Order 1 - Slept 0.5 seconds
Order 2 - Sleeping 0.5 seconds
Order 3 - Sleeping 0.5 seconds
Order 2 - Slept 0.5 seconds
Order 4 - Sleeping 0.5 seconds
Order 3 - Slept 0.5 seconds
Order 5 - Sleeping 0.5 seconds
Order 4 - Slept 0.5 seconds
Order 6 - Sleeping 0.5 seconds
Caught Exception, stopping all future orders
Order 5 - Slept 0.5 seconds
Order 4706 - Sleeping 0.5 seconds
Order 6 - Slept 0.5 seconds
Order 4706 - Slept 0.5 seconds
```

For some reason it's calling an order that's WAY in the future. I posted [this question on StackOverflow](https://stackoverflow.com/q/76891904), hoping to find an answer.

## Stop all current threads from running with Ctrl+C
[Source for example](https://gist.github.com/rusheb/ee9e3492e30e45f0c0ca69a666c10771), found from the comment on [this StackOverflow answer](https://stackoverflow.com/a/63495323)
``` python
import concurrent
from concurrent.futures import ThreadPoolExecutor
import time

POLL_INTERVAL = 1
MAX_WORKERS = 2

def do_work(name: str):
	count = 3
	for i in range(count):
		print(f"Thread {name} is working. Step {i+1} of {count}")
		time.sleep(1)

def main():
	tasks = ["one", "two", "three", "four", "five", "six", "seven"]
	with ThreadPoolExecutor(max_workers=MAX_WORKERS) as pool: # or ProcessPoolExecutor
		futures = [pool.submit(do_work, task_name) for task_name in tasks]
		futures_to_tasks = {future: task for future, task in zip(futures, tasks)}

		done, not_done = concurrent.futures.wait(futures_to_tasks.keys(), timeout=0)
		try:
			while not_done:
				freshly_done, not_done = concurrent.futures.wait(not_done, timeout=POLL_INTERVAL)
				done |= freshly_done
		except KeyboardInterrupt:
			for future in not_done:
				future.cancel()

			print("\n\n=== Keyboard Interrupt! ===")
			print(f"The following threads were successfully cancelled:")
			print([futures_to_tasks[future] for future in futures if future.cancelled()])
			print(f"\nWaiting for threads to exit gracefully:")
			print([futures_to_tasks[future] for future in futures if not future.done()])
			print("="*27 + "\n")

			_ = concurrent.futures.wait(not_done, timeout=None)

if __name__ == '__main__':
	main()
```

Sample execution:
```
$ python3 cancel_threadpool.py
Thread one is working. Step 1 of 3
Thread two is working. Step 1 of 3
Thread one is working. Step 2 of 3
Thread two is working. Step 2 of 3
^C

=== Keyboard Interrupt! ===
The following threads were successfully cancelled:
['three', 'four', 'five', 'six', 'seven']

Waiting for threads to exit gracefully:
['one', 'two']
===========================

Thread one is working. Step 3 of 3
Thread two is working. Step 3 of 3
```

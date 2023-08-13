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


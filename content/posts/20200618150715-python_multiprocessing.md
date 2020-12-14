+++
title = "Python Multiprocessing"
author = ["Alex Day"]
lastmod = 2020-12-13T20:15:47-05:00
draft = false
+++

tags
: [Python]({{< relref "20200618150702-python" >}})


## [Concurrent Futures](https://docs.python.org/3/library/concurrent.futures.html) {#concurrent-futures}

High level wrapper for async execution of callables. The basic idea is that execution is passed to either threads (with `ThreadPoolExecutor`) or processes (with `ProcessPollExecutor`). Both of them expose the same methods and inheret from the abstract `Executor` class.

To submit a single fuction for async work:

```python
from concurrent.futures import ThreadPoolExecutor

with ThreadPoolExecutor(max_workers=1) as executor:
    future = executor.submit(pow, 2, 5)
    print(future.result())
```

Can also map a single function over a list of iterables:

```python
from concurrent.futures import ThreadPoolExecutor
from math import exp

with ThreadPoolExecutor(max_workers=3) as executor:
    results = executor.map(exp, [1, 2, 3])

for result in results:
    print(result)
```

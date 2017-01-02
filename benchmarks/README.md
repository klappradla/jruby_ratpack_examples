# Benchmarks

Quick benchmarking to compare the Sinatra implementation against the Ratpack implementation.

## Setup

1. Install [wrk](https://github.com/wg/wrk)

1. Start the Go api without logging output to stdout

  ```sh
  /planet_service > /dev/null
  ```

1. Start the Sinatra or Ratpack example without logging output to stdout

  ```sh
  PLANETS_URL="http://localhost:3000/planets" bin/server > /dev/null  2>&1 &
  ```

1. Run the benchmark script

  ```sh
  wrk -c 100 -t 4 -d 30s -s request.lua http://localhost:5050
  ```

## Outcome

### Sinatra example

```sh
wrk -c 100 -t 4 -d 30s -s request.lua http://localhost:5050
Running 30s test @ http://localhost:5050
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   316.68ms  442.15ms   2.00s    84.60%
    Req/Sec   107.85     57.31   340.00     62.96%
  12718 requests in 30.09s, 43.04MB read
  Socket errors: connect 0, read 0, write 0, timeout 288
  Non-2xx or 3xx responses: 4
Requests/sec:    422.69
Transfer/sec:      1.43MB

wrk -c 100 -t 4 -d 30s -s request.lua http://localhost:5050
Running 30s test @ http://localhost:5050
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   321.45ms  446.41ms   2.00s    83.13%
    Req/Sec   103.62     61.17   310.00     65.91%
  11617 requests in 30.09s, 32.82MB read
  Socket errors: connect 0, read 0, write 0, timeout 312
  Non-2xx or 3xx responses: 3884
Requests/sec:    386.12
Transfer/sec:      1.09MB
```

## Ratpack example

```sh
wrk -c 100 -t 4 -d 30s -s request.lua http://localhost:5050
Running 30s test @ http://localhost:5050
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   223.42ms  307.60ms   2.00s    85.45%
    Req/Sec   229.17    109.87   610.00     66.91%
  24870 requests in 30.09s, 81.83MB read
  Socket errors: connect 0, read 0, write 0, timeout 56
  Non-2xx or 3xx responses: 2
Requests/sec:    826.42
Transfer/sec:      2.72MB

wrk -c 100 -t 4 -d 30s -s request.lua http://localhost:5050
Running 30s test @ http://localhost:5050
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   198.94ms  276.22ms   2.00s    86.18%
    Req/Sec   275.51    119.37   792.00     69.54%
  31760 requests in 30.07s, 79.54MB read
  Socket errors: connect 0, read 0, write 0, timeout 41
  Non-2xx or 3xx responses: 10960
Requests/sec:   1056.16
Transfer/sec:      2.64MB
```

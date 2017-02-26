# Benchmarks

Quick benchmarking to compare the Sinatra implementation against the Ratpack implementation. Using a locally running endpoint for the http requests due to rate limits on external ones.

## Setup

1. Install [wrk](https://github.com/wg/wrk)

1. Install the [Planet Service](https://github.com/klappradla/planet_service)

1. Start the Planet Service without logging output to stdout

  ```sh
  export GIN_MODE=release
  ./planet_service > /dev/null
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
❯ wrk -c 100 -t 4 -d 30s -s request.lua http://localhost:5050
Running 30s test @ http://localhost:5050
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   284.63ms  358.37ms   1.95s    85.07%
    Req/Sec   145.18     72.13   434.00     65.54%
  16392 requests in 30.08s, 64.94MB read
  Socket errors: connect 0, read 0, write 0, timeout 72
  Non-2xx or 3xx responses: 1
Requests/sec:    545.00
Transfer/sec:      2.16MB
```

## Ratpack example

```sh
❯ wrk -c 100 -t 4 -d 30s -s request.lua http://localhost:5050
Running 30s test @ http://localhost:5050
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   150.36ms  228.64ms   1.86s    88.18%
    Req/Sec   338.10    129.48   710.00     71.18%
  32746 requests in 30.08s, 127.09MB read
Requests/sec:   1088.56
Transfer/sec:      4.22MB
```

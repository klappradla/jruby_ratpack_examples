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
wrk -c 100 -t 4 -d 1m -s request.lua http://localhost:5050
Running 1m test @ http://localhost:5050
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   302.15ms  417.23ms   1.99s    84.58%
    Req/Sec   122.99     63.97   380.00     66.50%
  29176 requests in 1.00m, 83.26MB read
  Socket errors: connect 0, read 0, write 0, timeout 552
  Non-2xx or 3xx responses: 9735
Requests/sec:    485.58
Transfer/sec:      1.39MB
```

## Ratpack example

```sh
wrk -c 100 -t 4 -d 1m -s request.lua http://localhost:5050
Running 1m test @ http://localhost:5050
  4 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   183.24ms  255.69ms   1.97s    86.30%
    Req/Sec   328.76    141.23   830.00     68.23%
  78379 requests in 1.00m, 200.23MB read
  Socket errors: connect 0, read 0, write 0, timeout 13
  Non-2xx or 3xx responses: 26268
Requests/sec:   1305.99
Transfer/sec:      3.34MB
```

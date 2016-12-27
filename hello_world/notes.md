## jbundler

```sh
❯ jbundle install
...

jbundler provided classpath:
----------------

jbundler runtime classpath:
---------------------------
/Users/max/.m2/repository/org/javassist/javassist/3.19.0-GA/javassist-3.19.0-GA.jar
/Users/max/.m2/repository/io/ratpack/ratpack-core/1.4.0/ratpack-core-1.4.0.jar
/Users/max/.m2/repository/org/slf4j/slf4j-api/1.7.21/slf4j-api-1.7.21.jar
/Users/max/.m2/repository/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.7.5/jackson-dataformat-yaml-2.7.5.jar
/Users/max/.m2/repository/io/netty/netty-resolver/4.1.4.Final/netty-resolver-4.1.4.Final.jar
/Users/max/.m2/repository/com/fasterxml/jackson/core/jackson-annotations/2.7.0/jackson-annotations-2.7.0.jar
/Users/max/.m2/repository/org/reactivestreams/reactive-streams/1.0.0/reactive-streams-1.0.0.jar
/Users/max/.m2/repository/jline/jline/2.11/jline-2.11.jar
/Users/max/.m2/repository/io/netty/netty-common/4.1.4.Final/netty-common-4.1.4.Final.jar
/Users/max/.m2/repository/org/yaml/snakeyaml/1.14/snakeyaml-1.14.jar
/Users/max/.m2/repository/com/google/guava/guava/19.0/guava-19.0.jar
/Users/max/.m2/repository/com/fasterxml/jackson/core/jackson-databind/2.7.5/jackson-databind-2.7.5.jar
/Users/max/.m2/repository/com/github/ben-manes/caffeine/caffeine/2.3.1/caffeine-2.3.1.jar
/Users/max/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-guava/2.7.5/jackson-datatype-guava-2.7.5.jar
/Users/max/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-jdk8/2.7.5/jackson-datatype-jdk8-2.7.5.jar
/Users/max/.m2/repository/io/netty/netty-transport/4.1.4.Final/netty-transport-4.1.4.Final.jar
/Users/max/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-jsr310/2.7.5/jackson-datatype-jsr310-2.7.5.jar
/Users/max/.m2/repository/com/fasterxml/jackson/core/jackson-core/2.7.5/jackson-core-2.7.5.jar
/Users/max/.m2/repository/io/netty/netty-buffer/4.1.4.Final/netty-buffer-4.1.4.Final.jar
/Users/max/.m2/repository/io/netty/netty-codec-http/4.1.4.Final/netty-codec-http-4.1.4.Final.jar
/Users/max/.m2/repository/io/netty/netty-transport-native-epoll/4.1.4.Final/netty-transport-native-epoll-4.1.4.Final-linux-x86_64.jar
/Users/max/.m2/repository/io/netty/netty-handler/4.1.4.Final/netty-handler-4.1.4.Final.jar
/Users/max/.m2/repository/io/netty/netty-codec/4.1.4.Final/netty-codec-4.1.4.Final.jar

jbundler test classpath:
------------------------
	--- empty ---

jbundle complete !
```

## running it
```
❯ ruby server.rb
[main] INFO ratpack.server.RatpackServer - Starting server...
[main] INFO ratpack.server.RatpackServer - Building registry...
[main] INFO ratpack.server.RatpackServer - Ratpack started for http://localhost:5050
```

### Dependencies
* need logger (for ratpack handler chain) -> but example still works without


### Add request logging:

```ruby
require 'java'
require 'jruby/core_ext'
require 'bundler/setup'
Bundler.require

java_import 'ratpack.server.RatpackServer'
java_import 'ratpack.handling.RequestLogger'

RatpackServer.start do |server|
  server.handlers do |chain|
    chain.all(RequestLogger.ncsa)
    chain.get do |ctx|
      ctx.render 'Hello World from Ratpack / jRuby'
    end
  end
end
```

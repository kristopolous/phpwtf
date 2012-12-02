# phpwtf

This script reads things from argv and then queries the php website for the function signature.

It will cache the previous queries, because my disk has much lower latency then the internet and I don't lilke to waste my time. k?

## example

    $ phpwtf array_filter array_map
     array array_filter ( array $input [, callable $callback = "" ] )
     array array_map ( callable $callback , array $arr1 [, array $... ] )
    $

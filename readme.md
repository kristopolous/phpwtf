# phpwtf

This script reads things from argv and then queries a database for the function signature 

## Example

    $ phpwtf get file contents
    string     file_get_contents (string $filename [, bool $use_include_path = false [, resource $context [, int $offset = -1 [, int $maxlen ]]]])
    $ phpwtf md5
    string     md5 (string $str [, bool $raw_output = false ])
    string     md5_file (string $filename [, bool $raw_output = false ])

## Let's not stop now. Here's the best part.

    $ time phpwtf array map
    array      array_map (callable $callback, array $arr1 [, array $... ])
    0.012u 0.020s 0:00.03 100.0%    0+0k 0+0io 0pf+0w
    $

Oh, results in 0.03 seconds! That's what you get when everything has been scraped for you and is put in some 500k file in your home directory.

## Install

Try this:

    $ make


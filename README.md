# phpwtf

**phpwtf** is a command line tool to quickly display PHP function signatures in order to eliminate the constant need to look up PHP's documentation website to see order of the parameters, the proper name of the function, or the return values.

## Example

Pretend I forget whether the function to get a file's contents is `file_get_contents` or `get_file_contents`.  I can enter the terms as separate arguments and be reminded which one is correct:

    $ phpwtf get file contents
    string     file_get_contents (string $filename [, bool $use_include_path = false [, resource $context [, int $offset = -1 [, int $maxlen ]]]])

Similarly, I often forget how to do an `md5` in PHP.  Is it `md5sum` or `md5`?  I can do a substring match and get all the md5 related functions like this:

    $ phpwtf md5
    string     md5 (string $str [, bool $raw_output = false ])
    string     md5_file (string $filename [, bool $raw_output = false ])

Also, as you can see, the order of arguments is presented.  So if you are like me and forget how to invoke `in_array` or `strpos` you can quickly look that up:

    $ phpwtf in_array
    bool       in_array (mixed $needle, array $haystack [, bool $strict = FALSE ])

Best of all, **the database of signatures is cached**.

That means that the script looks at a local file to generate the output.  You don't have to worry about spotty or slow network connections in order to get the documentation for a function.  Here's an example of how fast it is:

    $ time phpwtf array map
    array      array_map (callable $callback, array $arr1 [, array $... ])
    0.012u 0.020s 0:00.03 100.0%    0+0k 0+0io 0pf+0w
    $

## Installation

There's a simple shell script, `install.sh` which puts `phpwtf` into your `$HOME/bin` directory and then stores the cache as `$HOME/.phpwtf-cache`.  As of this writing, it's 5 lines total so don't be frightened to inspect it.

    $ ./install.sh


## How does phpwtf work?

Inside the tools directory you'll find a `build-local-cache` file.  It does the following:

  1. Download the latest single-file php manual from a US php mirror
  2. Trims the file to something that is easier to parse
  3. Intereprets each function's html one at a time as a single signature "stanza", generated from #2
  4. Adds that to a PHP object.
  5. Serialize that to disk.
  6. Store as "reference.bz2" in the parent directory.

> Note: An instance of the reference is provided in this repository so you don't have to run this script.  But if you want, this entire process should take under a minute of wallclock time.

`installer.sh` bunzip2s this serialized object and places it in your home directory.  Then the tool `phpwtf` (stored in `$HOME/bin`) queries the object to find matches and displays it at your terminal.

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

## How does it work?

Inside the tools directory you'll find a `build-local-cache` file.  It does the following:

  1. Download the latest single-file php manual from a US php mirror
  2. Trims the file to something that is easier to parse
  3. Intereprets each function's html one at a time as a single signature "stanza", generated from #2
  4. Adds that to a PHP object.
  5. Serialize that to disk.
  6. Store as "reference.bz2" in the parent directory.

> Note: An instance of the reference is provided in this repository so you don't have to run this script.  But if you want, this entire process should take under a minute of wallclock time.

The installer (makefile) bunzip2s this serialized object and places it in your home directory.  Then the tool `phpwtf` (stored in $HOME/bin) queries the object to find matches and displays it at your terminal.

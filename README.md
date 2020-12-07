Config Parser
===========
Simple library, to help parse config files

Supported Formats
-----------------
Currently only Unix/Linux extensions and formatting is supported
```
['.cnf' , '.conf' , '.cfg' , '.cf']
```
Unix/Linux configs
==================
Supported types
* boolean  [true, false, on, off, yes, no]
* string   hello world
* integer  [1, 4, 100, 9987888]
* double   [1.0, 23.44, 100500.396]

Example
-------
```
# Comments are ignored
; This is also a comment
host = test.com
host_id=55331
server_threshold=2.5
log_file = /tmp/production.log
# comments inside with a new line
verbose = true
test_mode = on
debug_mode = off
notifications = yes
```
How to use
-----------------
* cd to the root forlder
* run `irb`
* require library, create object with proper file path
```
require './config_parser'
parser = ConfigParser.new './my-config.cfg'
configuration = parser.configure
```
An object with parsed options is created
```
configuration.verbose    => true       # boolean
configuration.debug_mode => false      # boolean
configuration.host       => 'test.com' # string
configuration.host_id    => 55331      # integer
configuration.server_threshold => 2.5  # double
```

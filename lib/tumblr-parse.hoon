:: Parser for Tumblr types
::
::
/-  tumblr
|%
::  get the response object out
++  user-info
  ^-  $-(json (unit user-info:tumblr))
  =+  jo
  %-  ot
  :_  ~
  'response'^user-info-r
::
::  parse the response object
++  user-info-r
  ^-  $-(json (unit user-info:tumblr))
  =+  jo
  %-  ot
  :~  
    'following'^ni
    'name'^so
    'default_post_format'^so
    'likes'^ni
    'blogs'^(ar blog)
  ==
++  blog
  ^-  $-(json (unit blog:tumblr))
  =+  jo
  %-  ot
  :~
    'name'^so
    'title'^so
    'url'^so
    'tweet'^so
    'primary'^bo
    'followers'^ni
  ==
--

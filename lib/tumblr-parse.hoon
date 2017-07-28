:: Parser for Tumblr types
::
::
/-  tumblr
|%
::  get the response object out
++  user-info-r
  ^-  $-(json (unit user-info-r:tumblr))
  =+  jo
  %-  ot
  :_  ~
  'response'^user
::
::  parse the response object
++  user
  ^-  $-(json (unit user:tumblr))
  =+  jo
  %-  ot
  :_  ~
  'user'^user-info
::
++  user-info
  ^-  $-(json (unit user-info:tumblr))
  =+  jo
  %-  ot
  :~  'following'^ni
      'name'^so
      'default_post_format'^so
      'likes'^ni
      'blogs'^(ar blog)
  ==
++  blog
  ^-  $-(json (unit blog:tumblr))
  =+  jo
  %-  ot
  :~  'name'^so
      'title'^so
      'url'^so
      'tweet'^so
      'primary'^bo
      'followers'^ni
  ==
++  blog-posts-r
  ^-  $-(json (unit blog-posts-r:tumblr))
  =+  jo
  %-  ot
  :_  ~
  'response'^blog-posts
++  blog-posts
  ^-  $-(json (unit blog-posts:tumblr))
  =+  jo
  %-  ot
  :_  ~
  'posts'^(ar post)
++  post
  ^-  $-(json (unit post:tumblr))
  =+  jo
  %-  ot
  :~  'blog_name'^so
      'id'^ni
      'post_url'^so
      'type'^so
      'date'^so
      'timestamp'^ni
      'format'^so
      'tags'^(ar so)
  ==
--

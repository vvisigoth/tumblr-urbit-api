::
::  /hoon/blog-post/tumblr/mar
::
/?    310
/-  tumblr
/+  tumblr-parse
!:
|_  info/user-info:tumblr
++  grab
  |%
  ++  json
    |=  jon/^json
    ^-  (list post:tumblr)
    %-  need
    (blog-posts-r:tumblr-parse jon)
  --
--

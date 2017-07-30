::  These types correspond to the types that Tumblr's API
::  produces, so please check Tumblr's documentation for
::  details.
::
::
|%
::  there has to be a better way to get just the response out
++  blog-posts-r  response/blog-posts
++  blog-posts  p/(list post)
++  post
  $%
  {$def-post def-post}
  {$photo-post photo-post}
  {$quote-post quote-post}
  {$link-post link-post}
  ==
++  def-post
  $:
    blog-name/@t
    id/@u
    post-url/@t
    type/@t
    date/@t
    timestamp/@u
    format/@t
    tags/(list @t)
  ==
++  user-info-r  response/user
++  user  u/user-info
++  user-info
  $:
    following/@u
    name/@t
    default-post-format/@t
    likes/@u
    blogs/(list blog)
  ==
++  blog
  $:
    name/@t
    title/@t
    url/@t
    tweet/@t
    primary/?
    followers/@u
  ==
++  photo
  $:
    caption/@t
    original-size/{width/@u height/@u url/@t}
    alt-sizes/(list {width/@u height/@u url/@t})
  ==
++  quote-post
  $:
    blog-name/@t
    id/@u
    post-url/@t
    type/@t  :: can be $%
    date/@t
    timestamp/@u
    tags/(list @t)
    source-url/@t
    source-title/@t
    text/@t
    source/@t
  ==
++  text-post
  $:
    blog-name/@t
    id/@u
    post-url/@t
    type/@t  :: can be $%
    date/time
    timestamp/@u
    state/@t
    format/@t
    reblog-key/@t
    tags/(list @t)
    note-count/@u
    title/@t
    body/@t :: is this right?
  ==
++  link-post
  $:
    blog-name/@t
    id/@u
    post-url/@t
    type/@t  :: can be $%
    date/@t
    timestamp/@u
    format/@t
    tags/(list @t)
    title/@t
    url/@t
    ::link-author/@t
    ::excerpt/@t
    ::publisher/@t
    photos/(list photo)
    ::summary/@t
  ==
++  photo-post
  $:
    blog-name/@t
    id/@u
    post-url/@t
    type/@t  :: can be $%
    date/@t
    timestamp/@u
    format/@t
    tags/(list @t)
    caption/@t
    photos/(list photo)
  ==
:: insert audio, chat, answer posts?
--

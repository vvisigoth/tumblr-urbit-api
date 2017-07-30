::  This is a connector for the Tumblr API v2
::
::  You can interact with this as such
::
::    - .^({type} %gx /=gh={/endpoint}) to read data or
::      .^(arch %gy /=gh={/endpoint}) to explore the possible
::
::
/?  314
/-  tumblr
/+  tumblr-parse, connector
::
!:
=>  |%
    ++  move  (pair bone card)
    ++  card  
      $%  {$diff sub-result}
          {$them wire (unit hiss)}
          {$hiss wire {$~ $~} $httr {$hiss hiss}}
      ==
    ::
    ::  Types of results we produce to subscribers.
    ::
    ++  sub-result
      $%  {$arch arch}
          {$json json}
          {$tumblr-user-info user-info:tumblr}
          {$tumblr-blog-posts (list post:tumblr)}
          {$null $~}
      ==
    --
=+  connector=(connector move sub-result)  ::  Set up connector library
::
|_  $:  hid/bowl
        hook/(map @t {id/@t listeners/(set bone)})  ::  map events to listeners
    ==
    ++  prep  _`.  ::  Clear state when code changes
::
::  List of endpoints
::
++  places
  |=  wir/wire
  ^-  (list place:connector)
  =+  (helpers:connector ost.hid wir "https://api.tumblr.com/v2")
  =>  |%
      ++  read-json
        |=  jon/json  ^-  (unit sub-result)
        `json+jon
      ++  read-user-info
        |=  jon/json  ^-  (unit sub-result)
        `tumblr-user-info+(need (user-info-r:tumblr-parse jon))
      ++  read-blog-posts
        |=  jon/json  ^-  (unit sub-result)
        ~&  jon
        `tumblr-blog-posts+(need (blog-posts-r:tumblr-parse jon))
      --
  :~  ^-  place                       ::  /user
      :*  guard={$user $~}
          read-x=read-null
          read-y=(read-static %info %dashboard ~)
          sigh-x=sigh-strange
          sigh-y=sigh-strange
      ==
      ^-  place                       ::  /user/info
      :*  guard={$user $info $~}
          read-x=(read-get /user/info)
          read-y=read-null
          sigh-x=read-user-info
          sigh-y=sigh-strange
      ==
      ^-  place                       ::  /blog/<ident>/posts
      :*  guard={$blog @t $posts $~}
          read-x=|=(a/path (get /blog/[+<.a]/posts))
          read-y=read-null
          sigh-x=read-blog-posts
          sigh-y=sigh-strange
      ==
  ==
::
::  When a peek on a path blocks, ford turns it into a peer on
::  /scry/{care}/{path}.  You can also just peer to this
::  directly.
::
::  We hand control to ++scry.
::
++  peer-scry
  |=  pax/path
  ^-  {(list move) _+>.$}
  ?>  ?=({care *} pax)
  :_  +>.$  :_  ~
  (read:connector ost.hid (places %read pax) i.pax t.pax)
::
::  HTTP response.  We make sure the response is good, then
::  produce the result (as JSON) to whoever sent the request.
::
++  sigh-httr
  |=  {way/wire res/httr}
  ^-  {(list move) _+>.$}
  ?.  ?=({$read care @ *} way)
    [~ +>.$]
  =*  style  i.way
  =*  ren  i.t.way
  =*  pax  t.t.way
  :_  +>.$  :_  ~
  :+  ost.hid  %diff
  (sigh:connector (places ren style pax) ren pax res)
::
::  HTTP error.  We just print it out, though maybe we should
::  also produce a result so that the request doesn't hang?
::
++  sigh-tang
  |=  {way/wire tan/tang}
  ^-  {(list move) _+>.$}
  %-  (slog >%gh-sigh-tang< tan)
  [[ost.hid %diff null+~]~ +>.$]
::
::  We can't actually give the response to pretty much anything
::  without blocking, so we just block unconditionally.
::
++  peek
  ::|=  {ren/@tas tyl/path}
  |=  tyl/path
  ^-  (unit (unit (pair mark *)))
  ~ ::``noun/[ren tyl]
--

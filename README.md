# Tumblr Urbit API integration
*Note* The Tumblr API docs do not accurately reflect all responses. I have implemented 
the major keys of blog post responses, but there are some missing. If you want 
the "reblog tag," you'll have to work for it ;)

## Install
- `|init-oauth1`
- enter tumblr api endpoint `api.tumblr.com` and your consumer key and secret for [your app](https://www.tumblr.com/oauth/apps)
- try `+https://api.tumblr.com/user/info`

## Connector commands
To see the information for the authenticated user
```
:dojo> /+  tumblr
:dojo> .^(user-info:tumblr %gx /=tumblr=/user/info/tumblr-user-info)
```

To see posts for a blog (not fully fleshed out yet)
```
:dojo> /+  tumblr
:dojo> .^((list post:tumblr) %gx /=tumblr=/blog/<identifier>/posts/tumblr-blog-posts)
```
To see all posts, you can also run the generator with either a blog identifier 
or the `@t` 'dashboard'. The latter will show the latest posts from your dashboard.
```
:dojo> +tumblr/feed <identifier|'dashboard'>
```

## Todo
- Accept `start-from` post id to make it easier to page through returns
- Better poke logic for accessing from web




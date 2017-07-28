# Tumblr Urbit API integration
*Note* Tumblr API responses very large. For right now, explicitly limit 
responses using query param `?limit=<NUM>`

## Install
- `|init-oauth1`
- enter tumblr api endpoint `api.tumblr.com` and your consumer key and secret
- try `+https://api.tumblr.com/user/info`

## Connector commands
To see the information for the authenticated user
`/+  tumblr`
`.^(user-info:tumblr /=tumblr=/user/info/user-info)`

To see posts for a blog (not fully fleshed out yet)
`/+  tumblr`
`.^((list post:tumblr) /=tumblr=/blog/<identifier>/posts/blog-posts)`




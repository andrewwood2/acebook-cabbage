json.posts do
  json.array! @posts, partial: 'post', as: :post
end

# NOTE: The important part here is that it's returning a hash rather than an array, as it has been named (line 1: we're calling the thing to be returned 'posts').
# The hash has a key 'posts' (set on line 1) and its values are the array (set out on line 2)
# The array is a bunch of 'post' items as per the _post.json.jbuilder file.
# Example output:
#
# {
#   "posts": [
#     {
#       "content": "goodbye world",
#       "id": 105,
#       "user_id": 2
#     },
#     {
#       "content": "hello world",
#       "id": 104,
#       "user_id": 2
#     },
#   ]
# }

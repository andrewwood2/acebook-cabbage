# This is a partial:
#   it is only meant to be used inside templates (not on its own)
#   convention is to prefix its name with an underscore 

# Sets what info you want to send as the json response, ideally keep it lean & light, for now have put in minimums but can add in 'created_at' or 'updated_at' if these are going to be used.

# Because 'post' is used in a few places, it's extracted out here to be reused as needed

json.id       post.id
json.content  post.content
json.user_id  post.user_id

# Alternative way of writing the above:
# json.(post, :id, :content, :user_id)

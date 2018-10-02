# This is a template
# You can render partials inside templates, as is done here - you can also render templates inside templates

json.post do
  json.partial! 'post', locals: { post: @post }
end
# renders the partial called 'post' (app/views/posts/_post.json.jbuilder)
# { post: @post } => sets local var called 'post' to be @post (passed in thru controller)
# The local var is what is used in rendering the partial

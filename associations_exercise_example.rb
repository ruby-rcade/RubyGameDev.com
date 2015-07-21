# Destroy everything, clear state
Post.destroy_all
Comment.destroy_all
Tag.destroy_all
User.destroy_all

# Create one user to create everything else connected to them
user = User.create!({email: 'example@example.com', username: 'example', password: 'password'})

post = Post.create!({title: "Example with hash", body_markdown: "Example", user_id: user.id})
Comment.create!({user: user, parent: post, body: "Hello!"})

post = Post.new
post.title = "Example with assignment"
post.body_markdown = "Example"
post.user_id = user.id
post.save!

post = Post.create! do |p|
  p.title = "Example with block"
  p.body_markdown = "Example"
  p.user_id = user.id
end

# Destroy everything, clear state
Post.destroy_all
Comment.destroy_all
Tag.destroy_all
User.destroy_all

# Create one user to create everything else connected to them
user = User.create!({email: 'example@example.com', username: 'example', password: 'password'})
user2 = User.create!({email: 'johnny@mail.com', username: 'Johnny', password: 'password'})
user3 = User.create!({email: 'cash@mail.com', username: 'Cash', password: 'password'})
user4 = User.create!({email: "b.manolova@yahoo.com", username: "Boryana Manolova", password: "password"})

# EXPERIMENT
# 1st post
post = Post.create!({title: 'Use Ruby to create games that run in your browser.', 
  body_markdown: "Using Opal, the Dare gem is a Ruby Game framework which compiles 
  your code to Javascript so you can run it in any browser.

  https://github.com/nicklink483/dare

  Here's a demo game: http://nicklink483.github.io/dare/tutorial.html

  For those familiar with Gosu, you'll find the API very similar.

  ", user_id: user.id })

# 2nd post
post2 = Post.new
post2.title = "Pixel Art Tutorial"
post2.body_markdown = "http://makegames.tumblr.com/post/42648699708/pixel-art-tutorial"
post2.user_id = user2.id
post2.save!

# 3d post
post3 = Post.create! do |p|
  p.title = "Ruby-Processing"
  p.body_markdown = "Ruby wrapper around the Processing language. 
  It can be used to develop video games in Ruby.

  https://github.com/jashkenas/ruby-processing"
  p.user_id = user3.id
end

# 1st comment exercise
Comment.create!({user: user, parent: post3, 
  body: "Oh interesting...Looks like it supports multiple versions of Ruby:

* Ruby 1.9.3 
* Ruby 2.0.0 
* Ruby 2.1.2 
* Ruby 2.2.0 
* JRuby preferred (required to use rubygems in sketches)"})

Comment.create!({user: user3, parent: post, 
  body: "Have you seen Yeah (https://github.com/yeahrb/yeah)? How does it compare?"})

# 2nd comment exercise
comment = Comment.create! do |c|
  c.user = user2
  c.parent = post
  c.body = "Nice! Looks cool. I'll have to check it out."
end

# 3d comment exercise
comment = Comment.new
comment.user = user2
comment.parent = post
comment.body = "I have seen Yeah. There are a couple differences. My API is very similar to Gosu,
 so anyone coming from that gem will feel right at home. Also,
 I've made it so that it's easy to make standalone js apps. But yes, Yeah is awesome!"
comment.save!

# 4th comment exercise
Comment.create!({user: user4, parent: post3,
  body: "If we clear the 'destroy state' is the post/page is going to save a comment
  written on the page? So after refresh this particular comment to be there?"})




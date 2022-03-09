require 'user'

module Mocks
  def create_users
    names = [
      { name: 'Emmanuel', bio: "Mathematics teacher", postsCounter: 1, email: 'emmanuel@2.com', role: 'admin' },
      { name: 'Ogah', bio: "English teacher", postsCounter: 1, email: 'ogah@2.com', role: 'admin' }
    ]
    (0..1).each do |i|
      user = User.new(names[i])
      user.password = 'admin123'
      user.password_confirmation = 'admin123'
      user.skip_confirmation!
      user.save!
    end
    User.all
  end

  def create_blogs(users)
    users.each do |user|
      (1..5).each do |j|
        Post.create(title: "Post number: #{j}", text: "This is post number: #{j}", commentsCounter: 0,
          likesCounter: 0, user_id: user.id)
      end
    end
    Post.all
  end

  def create_likes_comments(users, blogs)
    blogs.each do |blog|
      (0..1).each do |j|
        Like.create(user_id: users[j].id, blog_id: blog.id)
        Comment.create(user_id: users[j].id, blog_id: blog.id,
                       text: "I'm #{users[j].name} adding comment!.")
      end
    end
    [Like.all, Comment.all]
  end
end
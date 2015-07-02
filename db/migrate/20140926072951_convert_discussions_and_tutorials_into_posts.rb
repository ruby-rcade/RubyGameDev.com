class ConvertDiscussionsAndTutorialsIntoPosts < ActiveRecord::Migration
  class Discussion < ActiveRecord::Base
  end

  class Tutorial < ActiveRecord::Base
  end

  def change
    Discussion.all.each do |d|
      d_post = Post.create!(
        user_id: d.user_id,
        title: d.title,
        body_markdown: d.body,
        created_at: d.created_at,
        updated_at: d.updated_at
      )
      d.comments.each do |c|
        d_post.comments.create!(
          user_id: c.user_id,
          body: c.body,
          created_at: c.created_at,
          updated_at: c.updated_at
        )
      end
    end

    Tutorial.all.each do |t|
      t_post = Post.create!(
        user_id: t.user_id,
        title: t.title,
        body_markdown: t.url,
        created_at: t.created_at,
        updated_at: t.updated_at
      )
    end
  end
end

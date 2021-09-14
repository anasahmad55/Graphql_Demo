module Mutations
  class CreatePost < BaseMutation
    argument :title, String, required: true
    argument :body, String, required: true

    field :post, Types::PostType, null: false
    def resolve(title:, body:)
      post = Post.new(title: title, body: body)
      if post.save
        { post: post }
      else
        {
          post: nil
        }
      end
    end
  end
end

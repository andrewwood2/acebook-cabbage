class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user
  def user
    {
      user_id: self.object.user.id,
      name: self.object.user.name,
      profilepic: self.object.user.profilepic
    }
  end
  has_many :comments, serializer: CommentSerializer
  has_many :votes_for, serializer: VoteSerializer
end

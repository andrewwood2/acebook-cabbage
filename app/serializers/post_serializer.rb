class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user
  def user
    {
        user_id: self.object.user.id,
        name: self.object.user.name,
        profilepic: self.object.user.profilepic
    }
  end
end

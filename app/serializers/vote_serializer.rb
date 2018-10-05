class VoteSerializer < ActiveModel::Serializer
  attributes :id, :votable_id, :user
  def user
    {
      user_id: self.object.voter.id,
      name: self.object.voter.name,
    }
  end
end

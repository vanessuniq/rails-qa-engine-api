class VoteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :votable_type, :votable_id
  belongs_to :user
  belongs_to :votable, polymorphic: true
end

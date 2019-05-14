class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created_at, :updated_at, :kind,
             :priority, :status, :votes, :watches

  def votes
    object.votes.size
  end
  
  def watches
    object.watches.size
  end

  def _embedded
    {
        comments: object.comment,
        attached_files: object.attached_file.as_json_2
    }
  end
end
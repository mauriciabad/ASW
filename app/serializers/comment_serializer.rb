class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :issue_id, :created_at, :updated_at
  attributes  :_links

  def votes
    object.votes.size
  end
  
  def watches
    object.watches.size
  end

  def _embedded
    {
        comments: object.comment,
        attached_files: object.file
    }
  end
  
  def _links
    links = {
        self: { href: "/comments/#{object.id}" },
        creator: User.find(object.user_id).as_json_summary,
    }
    links
  end
end
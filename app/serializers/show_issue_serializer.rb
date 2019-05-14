class ShowIssueSerializer < IssueSerializer
  attributes :watches
  attribute :voted_by_current_user, if: :current_user?
  attribute :watched_by_current_user, if: :current_user?

  #attributes  :_links
  attributes  :_links, :_embedded

  def current_user?
    true if current_user
  end

  def watches
    object.watches.size
  end

  def voted_by_current_user
    object.votes.exists?(current_user.id)
  end

  def watched_by_current_user
    object.watches.exists?(current_user.id)
  end

  def _links
    links = {
        self: { href: "/issues/#{object.id}" },
        creator: object.user.as_json_summary,
    }
    
    if object.assigned_user
      links = links.merge(
          assigned_user: User.find(object.assigned_user).as_json_summary)
    end

    if current_user
      links = links.merge(
          votes: { href: "/issues/#{object.id}/votes" },
          watchs: { href: "/issues/#{object.id}/watches" }
      )
    end

    links
  end
end
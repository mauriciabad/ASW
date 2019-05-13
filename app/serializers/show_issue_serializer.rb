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

    if current_user
      links = links.merge(
          vote: { href: "/issues/#{object.id}/vote" },
          watch: { href: "/issues/#{object.id}/watch" }
      )
    end

    links
  end
end
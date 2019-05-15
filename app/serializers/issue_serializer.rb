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
    result = { comments: object.comment };

    if object.file.attached? 
      result[:attached_file] = {
        name: object.file.filename,
        content_type: object.file.content_type,
        id: object.file.id,
        byte_size: object.file.byte_size,
        created_at: object.file.created_at,
        url: Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: false, host: "localhost:3000")
      };
    end

    result;
  end
end
json.extract! issue, :id, :title, :description, :kind, :priority, :user_id, :created_at, :updated_at
json.url issue_url(issue, format: :json)

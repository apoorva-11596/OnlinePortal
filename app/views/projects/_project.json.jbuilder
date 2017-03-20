json.extract! project, :id, :description, :budget, :title, :deadline, :created_at, :updated_at
json.url project_url(project, format: :json)

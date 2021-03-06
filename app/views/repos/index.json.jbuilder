json.array!(@repos) do |repo|
  json.extract! repo, :id, :org_id, :git_id, :name, :full_name, :fork, :date_created, :date_updated, :date_pushed
  json.url repo_url(repo, format: :json)
end

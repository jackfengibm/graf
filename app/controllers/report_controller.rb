require "analytic_utils"
require "date_utils"

class ReportController < ApplicationController

  def index
    @metric_data = AnalyticUtils.get_pull_request_data()

    @pr_state_stats = AnalyticUtils.get_state_stats(@metric_data)

    @repos = Repo.order(:name)
    @organizations = Org.order(:login).select('DISTINCT(login)')
    @companies = Company.order(:name).select('DISTINCT(name)')
    @users = User.order(:login).select('DISTINCT(login)').where("login <> ''")
    @names = User.order(:name).select('DISTINCT(name)').where("name <> ''")
    @last_updated = GithubLoad.last
  end
  
end
class Request < ActiveRecord::Migration
  def change
    rename_column :users, :visible_summaries, :request_summaries
    rename_column :users, :visible_skills, :request_skills
    rename_column :users, :visible_teches, :request_teches
    rename_column :users, :visible_projects, :request_projects
    rename_column :users, :visible_languages, :request_languages
    rename_column :users, :visible_jobs, :request_jobs
  end
end

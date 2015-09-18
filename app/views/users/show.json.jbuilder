json.extract! @user, :id, :name, :email, :creation_date, :status, :podio_id, :created_at, :updated_at, :nickname, :phone, :skype, :podio_url, :request_summaries, :request_skills, :request_teches, :request_projects, :request_languages, :request_jobs, :form_url, :share_form, :greeting
json.projects_attributes  @projects
json.sums_attributes @user.sums
json.teches_attributes  @teches
json.jobs_attributes  @jobs
json.skills_attributes  @skills
json.projects_attributes  @projects
json.languages_attributes  @languages
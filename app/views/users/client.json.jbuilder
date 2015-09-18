
json.greeting  @user.greeting
json.extract! @user, :id, :name, :email
if @user.request_skills == true
json.skills_attributes  @user.skills
end

if @user.request_teches == true
json.teches_attributes  @user.teches
end

if @user.request_projects == true
json.projects_attributes  @user.projects
end


if @user.request_jobs == true
json.jobs_attributes  @user.jobs
end

if @user.request_languages == true
json.languages_attributes  @user.languages
end

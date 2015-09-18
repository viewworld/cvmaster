json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :creation_date, :status, :podio_id, :podio_url, :nickname, :phone, :skype, :form_url,:country
    json.projects user.projects
     json.techs user.teches
     json.jobs user.jobs
     json.skills user.skills
     json.extract! user.projects

end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_filter :authenticate_admin!, :only => [:client, :client_update,:user_thanks]
  # GET /users
  # GET /users.json
  def index

    if params[:tech].blank? and params[:months].blank? and params[:years].blank?
       @users = User.all
    else
      @u = []
      @users = []
      m = params[:months].to_i + params[:years].to_i * 12
        params[:tech].split(",").each do |t|
          us = User.joins(:teches).where("teches.technology_name LIKE ? AND teches.total_month > ? ", "%#{t}%", m)
          
          us.each do |u|
            @u << u
          end
      end
      @u = @u.uniq
      @u.each do |us|
        i = 0
        j = params[:tech].split(",").count
        params[:tech].split(",").each do |t|
          techs = Tech.where("teches.technology_name LIKE ? AND teches.total_month > ?", "%#{t}%",m)
          techs.each do |te|
           i = i + 1 if us.teches.include? te
          end
        end
      
        if i == j
          @users << us
        end
      end
    end  
    unless params[:keywords].blank?
    @u = []
   @users.each do |u|
     @u << u unless u.sums.where("sums.text LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.teches.where("teches.technology_name LIKE ?", "%#params[:keywords]}%").blank?
     @u << u unless u.projects.where("projects.name LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.projects.where("projects.description LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.projects.where("projects.client LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.projects.where("projects.goal LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.projects.where("projects.role LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.projects.where("projects.role LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.projects.where("projects.main_t LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.projects.where("projects.specific_t LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.jobs.where("jobs.company_name LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.jobs.where("jobs.description LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.jobs.where("jobs.role LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.jobs.where("jobs.main_t LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.languages.where("languages.language LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.languages.where("languages.level LIKE ?", "%#{params[:keywords]}%").blank?
     @u << u unless u.skills.where("skills.skill_name LIKE ?", "%#{params[:keywords]}%").blank?
   end
   @users = @u.uniq
    end

   @users = User.where(id: @users.map(&:id))
   if params[:sortby] == "jobs"
   @users = @users.order(jobs_count: :desc)
   end
  if params[:sortby] == "projects"
   @users = @users.order(projects_count: :desc)

 
  end

  if params[:sortby] == "created"
  @users =  @users.sort_by &:created_at
  end

  if params[:sortby] == "modified"
  @users =  @users.sort_by &:updated_at
  end
  
  if params[:sortby] == "status"
  @users =  @users.order(:status)
  end
  if params[:sortby] == "country"
  @users =  @users.order(:country)
  end

  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @skills = []
    if  !@user.skills_order.nil?
     @user.skills_order.split(",").map {|i| @skills << Skill.find(i.to_i) }
   else
    @skills = @user.skills
    end

     @teches = []
    if  !@user.teches_order.nil?
     @user.teches_order.split(",").map {|i| @teches << Tech.find(i.to_i) }
   else
    @teches = @user.teches
    end

     @languages = []
    if  !@user.languages_order.nil?
     @user.languages_order.split(",").map {|i| @languages << Language.find(i.to_i) }
   else
    @languages = @user.languages
    end


      @jobs = []
    if  !@user.jobs_order.nil?
     @user.jobs_order.split(",").map {|i| @jobs << Job.find(i.to_i) }
   else
    @jobs = @user.jobs
    end


      @projects = []
    if  !@user.projects_order.nil?
     @user.projects_order.split(",").map {|i| @projects << Project.find(i.to_i) }
   else
    @projects = @user.projects
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end

 def delete_user
  unless params[:user_id] == "undefined"
    a = User.find(params[:user_id])
    a.destroy

    @users = User.all
  end
  end




  def delete_sum
  unless params[:sum_id] == "undefined"
    a = Sum.find(params[:sum_id])
    a.destroy
  end
  end

  def delete_project
  unless params[:project_id] == "undefined"
    a = Project.find(params[:project_id])
    a.destroy
  end
  end

  def delete_language
  unless params[:language_id] == "undefined"
    a = Language.find(params[:language_id])
    a.destroy
  end
  end

  def delete_skill
  unless params[:skill_id] == "undefined"
    a = Skill.find(params[:skill_id])
    a.destroy
  end
  end

  def delete_job
  unless params[:job_id] == "undefined"
    a = Job.find(params[:job_id])
    a.destroy
  end
  end

  def delete_tech
  unless params[:tech_id] == "undefined"
    a = Tech.find(params[:tech_id])
    a.destroy
  end
  end
def user_thanks
  
end

  def client_update


    @user = User.find(params[:user][:id])

     if params[:saved] == "true"
      @user.share_form = true
      @user.save
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { render :user_thanks }
        format.json { render :client, status: :ok, token: @user.token }
      else
        format.html { render :users_client_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def from_podio
   
    if User.find_by_podio_id(params[:item_id]).nil?
      Podio.setup(:api_key => 'cvmaster-z7welh', :api_secret => '4oZtxlxwh8eB01G9S40q5Daph5OZBqKNdrWp48dWN9N3q0VoJsELW1rFDpcMO8sO')
      Podio.client.authenticate_with_credentials('ev@cz.fairpeople.com', 'M@$t3rKey')
      user = User.new
      item = Podio::Item.find(params[:item_id])
        item.fields.each do |field|
        if field["external_id"] == "full-name"
         user.name =   field["values"].first["value"].gsub(/<\/?[^>]*>/,"") 
        elsif field["label"] == "Phone"
        user.phone =  field["values"].first["value"].gsub(/<\/?[^>]*>/,"") 
        elsif field["label"] == "Skype"
        user.skype =  field["values"].first["value"].gsub(/<\/?[^>]*>/,"") 
        elsif field["external_id"] == "email"
        user.email =  field["values"].first["value"].gsub(/<\/?[^>]*>/,"") 
        elsif field["label"] == "Country"
        user.country =  field["values"].first["value"]["text"]
        elsif field["label"] == "Status"
        user.status = field["values"].first["value"]["text"]
        end
      end
      user.podio_url = item.link
      user.podio_id = item.id
      user.share_form = true
      user.token =  SecureRandom.hex
      user.form_url = "http://52.17.211.0:3000/users/client?token=" + user.token

      user.save
    end
  end

  def client
   @user =  User.find_by_token(params[:token])
   if @user.share_form == true
       @a = []
     if @user.request_summaries == true
     @a << @user.request_summaries.to_json
     end 
   else
    respond_to do |format|
      format.html {  render :client_access_denied  }
    end
   end
  end
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    Podio.setup(:api_key => 'cvmaster-z7welh', :api_secret => '4oZtxlxwh8eB01G9S40q5Daph5OZBqKNdrWp48dWN9N3q0VoJsELW1rFDpcMO8sO')
    Podio.client.authenticate_with_credentials('ev@cz.fairpeople.com', 'M@$t3rKey')
    item = Podio::Item.new({:fields =>[{"status"=>"active", "external_id"=>"full-name", "config"=>{"default_value"=>nil, "description"=>nil, "settings"=>{"format"=>"plain", "size"=>"small"}, "required"=>false, "mapping"=>nil, "label"=>"Full Name", "visible"=>true, "delta"=>0, "hidden"=>false, "unique"=>false}, "field_id"=>102161272, "label"=>"Full Name", "values"=>[{"value"=>"@@"}], "type"=>"text"}, {"status"=>"active", "external_id"=>"phone", "config"=>{"default_value"=>nil, "description"=>nil, "settings"=>{"call_link_scheme"=>"callto", "possible_types"=>["mobile", "work", "home", "main", "work_fax", "private_fax", "other"]}, "required"=>false, "mapping"=>nil, "label"=>"Phone", "visible"=>true, "delta"=>3, "hidden"=>false, "unique"=>false}, "field_id"=>102161275, "label"=>"Phone", "values"=>[{"type"=>"work", "value"=>"+77777777777"}], "type"=>"phone"}, {"status"=>"active", "external_id"=>"email", "config"=>{"default_value"=>nil, "description"=>nil, "settings"=>{"include_in_bcc"=>false, "include_in_cc"=>false, "possible_types"=>["work", "home", "other"]}, "required"=>false, "mapping"=>nil, "label"=>"Email", "visible"=>true, "delta"=>4, "hidden"=>false, "unique"=>false}, "field_id"=>102161274, "label"=>"Email", "values"=>[{"type"=>"work", "value"=>"aaaaaaaaaaaaaaa@bbbbbbbbbbbbbbbbb.ru"}], "type"=>"email"}, {"status"=>"active", "external_id"=>"skype", "config"=>{"default_value"=>nil, "description"=>nil, "settings"=>{"format"=>"plain", "size"=>"small"}, "required"=>false, "mapping"=>nil, "label"=>"Skype", "visible"=>true, "delta"=>7, "hidden"=>false, "unique"=>false}, "field_id"=>102161277, "label"=>"Skype", "values"=>[{"value"=>"SKAAAIIIP"}], "type"=>"text"}]})
    item.fields.each do |field|
      if field["external_id"] == "full-name"
        field["values"].first["value"] = @user.name + ""
      elsif field["label"] == "Phone"
        field["values"].first["value"] = @user.phone + " "
      elsif field["label"] == "Skype"
        field["values"].first["value"] = @user.skype + " "
      elsif field["external_id"] == "email"
         field["values"].first["value"] = @user.email + " "
      end
    end
     saved_item =  Podio::Item.create(13282070, item)
     @user.podio_id = saved_item.id
     @user.podio_url = saved_item.link
     @user.token =  SecureRandom.hex
     @user.form_url = "http://52.17.211.0:3000/users/client?token=" + @user.token
     @user.share_form = true
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
   
    

    respond_to do |format|
      if @user.update(user_params)
         @skills = @user.skills
         @jobs = @user.jobs
         @projects = @user.projects
         @languages = @user.languages
         @teches = @user.teches
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :creation_date, :status, :podio_id, :podio_url, :nickname, :skype, :phone, :request_summaries, :request_skills, :request_teches, :request_projects, :request_jobs, :request_languages, :form_url, :share_form, :greeting,
    :skills_order, 
    :projects_order, 
    :jobs_order, 
    :languages_order, 
    :teches_order, 
    :country,
                                   sums_attributes: [:id, :text, :add_pdf, :_destroy],
                                   teches_attributes: [:id, :technology_name,:add_pdf, :years, :months, :_destroy],
                                   skills_attributes: [:id, :skill_name, :add_pdf, :years, :months, :_destroy],
                                   projects_attributes: [:id, :end_date,:add_pdf, :start_date, :name, :description, :client, :hours, :goal, :role, :main_t, :specific_t, :business_domain, :_destroy],
                                   jobs_attributes: [:id, :end_date, :add_pdf, :start_date, :company_name, :description, :role, :main_t, :_destroy],
                                   languages_attributes: [:id, :language, :add_pdf, :level, :_destroy])
    end


end

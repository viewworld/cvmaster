class User < ActiveRecord::Base

  # before_create :export_to_podio
  has_many :sums, dependent: :destroy
  has_many :teches, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :skills, dependent: :destroy
  accepts_nested_attributes_for :sums,:allow_destroy => true
  accepts_nested_attributes_for :teches,:allow_destroy => true
  accepts_nested_attributes_for :projects,:allow_destroy => true
  accepts_nested_attributes_for :jobs,:allow_destroy => true
  accepts_nested_attributes_for :languages,:allow_destroy => true
  accepts_nested_attributes_for :skills,:allow_destroy => true


  

  # def export_to_podio
  
  #   Podio.setup(:api_key => 'cvmaster', :api_secret => 'UziHY7HNegLAc30fyfRa2OvQUNJ1wDnfIsqiPfeplmkXyb1KtsOLV683XE0t3ZOt')
  #   Podio.client.authenticate_with_credentials('dk@cz.fairpeople.com', 'dnkdnkdnk1')
  #   item = Podio::Item.new({:fields =>[{"status"=>"active", "external_id"=>"title", "config"=>{"default_value"=>nil, "description"=>nil, "settings"=>{"format"=>"plain", "size"=>"small"}, "required"=>false, "mapping"=>nil, "label"=>"Full name", "visible"=>true, "delta"=>0, "hidden"=>false, "unique"=>false}, "field_id"=>102952640, "label"=>"Full name", "values"=>[{"value"=>"eedededed"}], "type"=>"text"}, {"status"=>"active", "external_id"=>"wdqdwqdwqtext", "config"=>{"default_value"=>nil, "description"=>nil, "settings"=>{"format"=>"html", "size"=>"large"}, "required"=>false, "mapping"=>nil, "label"=>"Phone", "visible"=>true, "delta"=>1, "hidden"=>false, "unique"=>false}, "field_id"=>102952736, "label"=>"Phone", "values"=>[{"value"=>"<p>wqdqwdqwd</p>"}], "type"=>"text"}, {"status"=>"active", "external_id"=>"qwddwqwqdtext", "config"=>{"default_value"=>nil, "description"=>nil, "settings"=>{"format"=>"html", "size"=>"large"}, "required"=>false, "mapping"=>nil, "label"=>"Skype", "visible"=>true, "delta"=>2, "hidden"=>false, "unique"=>false}, "field_id"=>102952737, "label"=>"Skype", "values"=>[{"value"=>"<p>wdqwqdwdqwdqwdq</p>"}], "type"=>"text"}]})
  #   item.fields.each do |field|
  #     if field["label"] == "Full name"
  #       field["values"].first["value"] = self.name + " "
  #     elsif field["label"] == "Phone"
  #       field["values"].first["value"] = self.phone + " "
  #     elsif field["label"] == "Skype"
  #       field["values"].first["value"] = self.skype + " "

  #     elsif field["label"] == "Status"
        
  #     end
  #   end
  #    saved_item =  Podio::Item.create(13445101, item)
  #    self.podio_id = saved_item.id
  #    self.podio_url = saved_item.link
  #    self.form_url = "http://52.17.211.0:3000/users/client?token=" + SecureRandom.hex
  # end

end

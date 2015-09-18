class Dwqqwd < ActiveRecord::Migration
  def change
    rename_column :jobs, :job_name, :company_name
  end
end

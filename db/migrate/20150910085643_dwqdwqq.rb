class Dwqdwqq < ActiveRecord::Migration
  def change
    add_column :jobs, :add_pdf, :boolean
    add_column :teches, :add_pdf, :boolean
    add_column :sums, :add_pdf, :boolean
    add_column :languages, :add_pdf, :boolean
    add_column :projects, :add_pdf, :boolean
  end
end

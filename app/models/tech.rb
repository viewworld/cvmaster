class Tech < ActiveRecord::Base
  belongs_to :user
  before_save :total_month_count

  def total_month_count
    self.total_month = self.months + self.years*12
  end
end

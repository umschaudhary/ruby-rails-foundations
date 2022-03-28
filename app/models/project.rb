class Project < ApplicationRecord
  # custom scopes
  # add defaults
  # integrate validations
  # integrate callbacks
  # integrating database relationships
  after_initialize:set_defaults


  scope:almost_completed, -> { where('percent_complete > 50') }
  scope:still_need_some_work, -> { where('percent_complete < 20') }

  def set_defaults
    self.percent_complete ||= 0.0
  end

  validates_presence_of :title, :description

end

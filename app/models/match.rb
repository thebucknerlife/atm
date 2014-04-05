class Match < ActiveRecord::Base

  validates_presence_of :host_id, :guest_id, :activity

end

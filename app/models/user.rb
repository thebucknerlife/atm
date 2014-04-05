class User < ActiveRecord::Base

  validates_presence_of :name
  
  has_many :hosting_matches, class_name: "Match", foreign_key: :host_id

end

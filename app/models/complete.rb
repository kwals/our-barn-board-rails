class Complete < ActiveRecord::Base
  belongs_to :routine
  belongs_to :user
  
end

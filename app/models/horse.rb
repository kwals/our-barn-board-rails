class Horse < ActiveRecord::Base
  belongs_to :user
  has_many :routines
end

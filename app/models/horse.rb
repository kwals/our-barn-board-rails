class Horse < ActiveRecord::Base
  belongs_to :user
  has_many :routines

  validates_uniqueness_of :name
  validates_uniqueness_of :registered_name
end

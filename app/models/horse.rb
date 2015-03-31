class Horse < ActiveRecord::Base
  belongs_to :user
  has_many :routines
  has_many :completes, through: :routines

  validates_uniqueness_of :name
  validates_uniqueness_of :registered_name
# How can I make sure the horse belongs to an existing user?
end

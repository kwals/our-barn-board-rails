class Routine < ActiveRecord::Base
  belongs_to :horse
  has_many :completes
end

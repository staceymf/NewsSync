class Feed < ActiveRecord::Base
  belongs_to  :user
  has_many    :sources
  # has_many    :outlets
end

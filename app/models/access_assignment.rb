class AccessAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :access_role
end

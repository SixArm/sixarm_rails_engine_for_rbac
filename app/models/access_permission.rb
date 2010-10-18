class AccessPermission < ActiveRecord::Base
  belongs_to :access_role
  belongs_to :access_operation
end

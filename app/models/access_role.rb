class AccessRole < ActiveRecord::Base
  has_many :access_assignments
  has_many :users, :through => :access_assignments
  has_many :access_permissions
  has_many :access_operations, :through => :access_permissions

  def to_sym
    return xid.to_sym
  end

end

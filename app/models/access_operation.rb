class AccessOperation < ActiveRecord::Base
  has_many :access_permissions
  has_many :access_roles, :through => :access_permissions

  def to_sym
    return xid.to_sym
  end

end

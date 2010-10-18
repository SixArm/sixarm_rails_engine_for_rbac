class AccessPermissionsController < ApplicationController
  unloadable
  resource_controller

  def grid
    @access_operations=AccessOperation.find(:all)
    @access_permissions=AccessPermission.find(:all)
    @access_roles=AccessRole.find(:all)
  end

end

class AccessAssignmentsController < ApplicationController
  unloadable
  resource_controller

  def grid
    @users=User.find(:all)
    @access_assignments=AccessAssignment.find(:all)
    @access_roles=AccessRole.find(:all)
  end

end

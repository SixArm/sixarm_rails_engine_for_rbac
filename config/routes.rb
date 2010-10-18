ActionController::Routing::Routes.draw do |map|
  map.resources :rbac_assignments
  map.resources :rbac_permissions
  map.resources :rbac_operations
  map.resources :rbac_roles
end

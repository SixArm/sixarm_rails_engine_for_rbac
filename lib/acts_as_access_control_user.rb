module ActiveRecord #:nodoc:  
  module Acts #:nodoc:  
    module Access #:nodoc:  
      def self.included(base)  
        base.extend(ClassMethods)  
      end  

      module ClassMethods  
       def acts_as_access_control_user
         include ActiveRecord::Acts::Access::InstanceMethods  
         extend ActiveRecord::Acts::Access::SingletonMethods  
         has_many :access_assignments
         has_many :access_roles, :through => :access_assignments
       end  
      end  
      
      module SingletonMethods  
      end  
      
      module InstanceMethods  

        # Does this user have any of the given roles?
        #
        # ==Example
        #   user.role?(:administrator,:auditor,:reporter)
        #   => return true iff the user has any of these roles
        #
        # N.b. you can provide the roles as syms or strings
        # because this method casts the roles to syms.
        #
        # Return true iff the user has any of the given roles.

        def access_role?(*access_role_sym_list)
          0<AccessRole.count_by_sql("select access_roles.xid from access_roles join access_assignments on access_assignments.access_role_id=access_roles.id join users on access_assignments.user_id=#{users.id} and access_roles.xid in [" + access_role_sym_list.join(',','"','"') +"]")
        end


        # Does this user have any of the given operations?
        #
        # ==Example
        #   user.operaton(:view,:update,:edit)
        #   => return true iff the user has any of these operations
        #
        # N.b. you can provide the operations as objects, syms, strings, etc.
        # because this method casts the operations to syms.
        #
        # Return true iff the user has any role that has any of the given operations.

        def access_operation?(*access_operation_sym_list)
          0<AccessOperation.count_by_sql("select access_operations.xid from access_operations join access_permissions on access_permissions.access_operation_id=access_operations.id join access_roles on access_permissions.access_role_id=access_roles.id join access_assignments on access_assignments.access_role_id=access_roles.id join users on access_assignments.user_id=#{users.id} and access_operations.xid in [" + access_operations_sym_list.join(',','"','"') +"]")
        end
        
      end  

    end  
  end  
end  

ActiveRecord::Base.send(:include, ActiveRecord::Acts::Access) 

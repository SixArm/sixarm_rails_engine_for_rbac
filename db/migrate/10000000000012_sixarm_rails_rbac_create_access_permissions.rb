class SixArmRailsRbacCreateAccessPermissions < ActiveRecord::Migration

  TABLE = 'access_permissions'

  def self.up

    create_table TABLE, :force => true do |t|

      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :creator_id, :integer
      t.column :updator_id, :integer
      t.column :status, :integer

      t.integer :access_role_id
      t.integer :access_operation_id

    end

    add_index TABLE, :created_at
    add_index TABLE, :updated_at
    add_index TABLE, :creator_id
    add_index TABLE, :updator_id
    add_index TABLE, :status

    add_index TABLE, :access_role_id
    add_index TABLE, :access_operation_id

  end

  def self.down
    drop_table TABLE
  end

end


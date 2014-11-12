class AddOrganizationIdToTrials < ActiveRecord::Migration
  def change
    add_column :trials, :organization_id, :string
  end
end

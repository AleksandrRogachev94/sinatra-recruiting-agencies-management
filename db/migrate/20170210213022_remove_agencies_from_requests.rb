class RemoveAgenciesFromRequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :requests, :agency_id
  end
end

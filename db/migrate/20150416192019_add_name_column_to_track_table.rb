class AddNameColumnToTrackTable < ActiveRecord::Migration
  def change
    add_column :tracks, :name, :string
  end
end

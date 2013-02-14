class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.integer :country_id
      t.integer :video_id
      t.integer :policy_id, :default => 1

      t.timestamps
    end

    add_index :releases, [:video_id, :policy_id]
  end
end

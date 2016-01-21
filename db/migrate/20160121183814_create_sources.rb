class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.integer :feed_id
      t.string  :name

      t.timestamps null: false
    end
  end
end

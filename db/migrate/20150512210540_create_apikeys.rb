class CreateApikeys < ActiveRecord::Migration
  def change
    create_table :apikeys do |t|
      t.string :access_key
      t.references :user, index: true

      t.timestamps
    end
  end
end

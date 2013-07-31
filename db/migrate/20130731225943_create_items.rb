class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :content
      t.references :poll

      t.timestamps
    end
    add_index :items, :poll_id
  end
end

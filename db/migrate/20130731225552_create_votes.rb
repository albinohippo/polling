class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :ip_address
      t.references :item

      t.timestamps
    end
    add_index :votes, :item_id
  end
end

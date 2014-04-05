class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :host_id
      t.integer :guest_id
      t.string :activity

      t.timestamps
    end
  end
end

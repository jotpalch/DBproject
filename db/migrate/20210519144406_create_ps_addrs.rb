class CreatePsAddrs < ActiveRecord::Migration[6.1]
  def change
    create_table :ps_addrs do |t|
      t.string :name
      t.string :content
      t.string :traffic_information
      t.string :display_addr
      t.string :poi_addr

      t.timestamps
    end
  end
end

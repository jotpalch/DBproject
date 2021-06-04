class CreateCctvCoors < ActiveRecord::Migration[6.1]
  def change
    create_table :cctv_coors do |t|
      t.string :no
      t.float :lat
      t.float :lng
      t.string :dir

      t.timestamps
    end
  end
end

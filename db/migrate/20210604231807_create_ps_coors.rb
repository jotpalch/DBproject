class CreatePsCoors < ActiveRecord::Migration[6.1]
  def change
    create_table :ps_coors do |t|
      t.string :no
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end

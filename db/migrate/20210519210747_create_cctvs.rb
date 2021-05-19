class CreateCctvs < ActiveRecord::Migration[6.1]
  def change
    create_table :cctvs do |t|
      t.string :no
      t.string :ps
      t.string :addr
      t.string :direction

      t.timestamps
    end
  end
end

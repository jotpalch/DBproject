class CreateScooterStoles < ActiveRecord::Migration[6.1]
  def change
    create_table :scooter_stoles do |t|
      t.string :no
      t.string :case
      t.string :date
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end

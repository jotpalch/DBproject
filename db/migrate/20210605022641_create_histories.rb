class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.string :q
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end

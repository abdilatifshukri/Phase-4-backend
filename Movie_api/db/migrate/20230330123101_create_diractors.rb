class CreateDiractors < ActiveRecord::Migration[7.0]
  def change
    create_table :diractors do |t|
      t.string :name
      t.string :age
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end

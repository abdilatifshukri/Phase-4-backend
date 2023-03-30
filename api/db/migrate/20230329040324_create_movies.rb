class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.string :image
      t.belongs_to :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end

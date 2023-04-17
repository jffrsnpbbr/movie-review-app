class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.belongs_to :user
      t.string :title
      t.text :blurb
      t.date :release_date
      t.string :country
      t.date :showing_start
      t.date :showing_end

      t.timestamps
    end
  end
end

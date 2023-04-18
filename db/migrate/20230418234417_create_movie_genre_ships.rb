class CreateMovieGenreShips < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_genre_ships do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end

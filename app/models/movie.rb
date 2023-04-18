class Movie < ApplicationRecord
  belongs_to :user

  has_many :movie_genre_ships
  has_many :genre, through: :movie_genre_ships
end

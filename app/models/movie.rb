class Movie < ApplicationRecord
  belongs_to :user

  has_many :movie_genre_ships
  has_many :genres, through: :movie_genre_ships

  def destroy
    update(deleted_at: Time.now)
  end
end

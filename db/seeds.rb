# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Movie.destroy_all
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create!(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create!(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['THE_MOVIE_DB_KEY']}&language=en-US&page="

poster_base_url = 'https://image.tmdb.org/t/p/w500'

puts ' Generating movies '.center(50, '=')

URI.open("http://tmdb.lewagon.com/movie/top_rated") do |lines|
  lines.each_line do |line|
    results = JSON.parse(line)
    results["results"].each do |result|
      if result["original_language"] == 'en'
        image = "https://image.tmdb.org/t/p/original#{result["poster_path"]}"
        Movie.create(
          title: result["title"],
          rating: result["vote_average"],
          overview: result["overview"],
          poster_url: image
        )
      end
    end
  end
end

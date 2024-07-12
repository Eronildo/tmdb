sealed class ResponseJsonMocks {
  static const searchResponseJson = '''
  {
    "page": 1,
    "results": [
      {
        "adult": false,
        "backdrop_path": "/sTrbHp9ERN8YlUsnbDPmXW8QPLq.jpg",
        "genre_ids": [
            35
        ],
        "id": 629374,
        "original_language": "en",
        "original_title": "John",
        "overview": "A day in the life of John Lennon, alive and well in modern-day New York City. The former Beatle squabbles with a security guard, commiserates with his best friend over lunch, and upsets a bully.",
        "popularity": 4.343,
        "poster_path": "/jI3J69Yzl2NzeKnNBOTDf00jodx.jpg",
        "release_date": "2018-09-08",
        "title": "John",
        "video": false,
        "vote_average": 6.8,
        "vote_count": 20
      }
    ]
  }
''';

  static const moviesResponseJson = '''
  {
      "page": 1,
      "results": [
          {
              "backdrop_path": "/fqv8v6AycXKsivp1T5yKtLbGXce.jpg",
              "id": 653346,
              "title": "Kingdom of the Planet of the Apes",
              "original_title": "Kingdom of the Planet of the Apes",
              "overview": "Several generations following Caesar's reign, apes – now the dominant species – live harmoniously while humans have been reduced to living in the shadows. As a new tyrannical ape leader builds his empire, one young ape undertakes a harrowing journey that will cause him to question all he's known about the past and to make choices that will define a future for apes and humans alike.",
              "poster_path": "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
              "media_type": "movie",
              "adult": false,
              "original_language": "en",
              "genre_ids": [
                  878,
                  12,
                  28
              ],
              "popularity": 2365.896,
              "release_date": "2024-05-08",
              "video": false,
              "vote_average": 7.049,
              "vote_count": 1619
          },
          {
              "backdrop_path": "/c7vj3fQZSK445Q91a7SQ0DyZNVM.jpg",
              "id": 1066262,
              "title": "The Convert",
              "original_title": "The Convert",
              "overview": "Munro, a soldier turned lay preacher, comes to New Zealand to minister to the first British colonists, but he is converted by the powerful chief Maianui to serve a different purpose.",
              "poster_path": "/e5ZqqPlhKstzB4geibpZh38w7Pq.jpg",
              "media_type": "movie",
              "adult": false,
              "original_language": "en",
              "genre_ids": [
                  28,
                  18
              ],
              "popularity": 28.534,
              "release_date": "2024-03-14",
              "video": false,
              "vote_average": 5.0,
              "vote_count": 3
          }
      ],
      "total_pages": 1000,
      "total_results": 20000
    }
  ''';

  static const movieCreditsResponseJson = '''
  {
    "id": 653346,
    "cast": [
        {
            "adult": false,
            "gender": 2,
            "id": 1586047,
            "known_for_department": "Acting",
            "name": "Owen Teague",
            "original_name": "Owen Teague",
            "popularity": 26.57,
            "profile_path": "/tgCkGE0LIggyjMmgSwHhpZAkfJs.jpg",
            "cast_id": 9,
            "character": "Noa",
            "credit_id": "630449a821118f007d331afa",
            "order": 0
        },
        {
            "adult": false,
            "gender": 0,
            "id": 86599,
            "known_for_department": "Directing",
            "name": "Jon Mallard",
            "original_name": "Jon Mallard",
            "popularity": 3.733,
            "profile_path": null,
            "credit_id": "664faf8248791d4e2d859cff",
            "department": "Directing",
            "job": "First Assistant Director"
        },
        {
            "adult": false,
            "gender": 0,
            "id": 1401734,
            "known_for_department": "Crew",
            "name": "Glenn Suter",
            "original_name": "Glenn Suter",
            "popularity": 2.62,
            "profile_path": null,
            "credit_id": "664faf8aa91c2b970add4f15",
            "department": "Crew",
            "job": "Stunt Coordinator"
        }
    ]
  }
  ''';
}

resource "heroku_app" "bookshelf_api" {
  name   = "cw-bookshelf-api"
  region = "eu"

  config_vars = {
    SPRING_PROFILES_ACTIVE = "heroku"
  }
}

resource "heroku_addon" "bookshelf_api_database" {
    app  = heroku_app.bookshelf_api.name
    plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_addon" "bookshelf_api_newrelic" {
    app  = heroku_app.bookshelf_api.name
    plan = "newrelic:wayne"
}


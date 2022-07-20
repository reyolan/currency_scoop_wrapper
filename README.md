# Currency Scoop Wrapper

A simple application to illustrate wrapping of Currency Scoop API.

- See latest currency exchange rates
- See all fiat currencies
- See historical exchange rates
- Convert a currency to another currency

## Endpoints

See [Currency Scoop API Documentation](https://currencyscoop.com/api-documentation) for list of all endpoints.

Available endpoints in this wrapper only covers the free tier endpoints, as stated below:

- latest
- historical
- currencies
- convert

## Getting started

To get started with the app, clone the repo and access the created directory:

```
$ git clone git@github.com:reyolan/currency_scoop_wrapper.git
$ cd currency_scoop_wrapper
```

Install the needed gems and node modules:

```
$ bundle install
$ yarn
```

Next, setup the database:

```
$ bin/rails db:setup
```

Run the app by starting the Rails dev server and Vite.js dev server:

```
$ bin/rails server
$ bin/vite dev
```

You can then visit the site with this URL: http://localhost:3000

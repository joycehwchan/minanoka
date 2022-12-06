# MinaNoka

A market place for farming fields build with Ruby on Rails.

<div align="center">
<img width="640" alt="MinaNoka01" src="https://user-images.githubusercontent.com/109743083/205652232-4f0849ea-2e06-439e-816b-da0ffdad27b5.png">
<img width="640" alt="MinaNoka02" src="https://user-images.githubusercontent.com/109743083/205652316-7d2d4d03-de16-4fa3-9653-a298cfc90afe.png">
</div>

<br>
👉 App home: http://www.minanoka.com/
<br>

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
MAPBOX_API_KEY=your_own_yelp_api_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Team Members
- [Joyce Chan](https://www.linkedin.com/in/joycehwchan/)
- [Fredrik Kawahara Faeger](https://www.linkedin.com/in/fredfaeger/)
- [Christopher Crespo](https://www.linkedin.com/in/christopher-ikaika-crespo/)
- [Hafid Qarchi](https://www.linkedin.com/in/hafid-qa/)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License

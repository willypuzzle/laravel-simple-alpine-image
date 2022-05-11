<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

## About This sample

This is a sample to show how a container with an alpine based image can be used for develop purpose.

###Steps:
- clone the reposito on your pc
- run: docker-compose up -d
- go, inside the container (e.g. "docker exec -it <container id> /bin/bash" )
- run: cd /var/www/html
- run: composer install
- run: cp .env.example .env
- run: php artisan key:generate

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT) and this sample too.

[Visit the production page here](https://luistodoapi.herokuapp.com/)<br>

This is a simple API written in Ruby using the Rails framework. 
ruby '2.2.0'
Rails 4.0.10

To get this api running you need to migrate database, configure SECRET_KEY_BASE:, DEVISE_SECRET_KEY and MAILGUN_SMTP_PASSWORD:. I do this using the Figaro gem.

Here are the step by step instructions. 

1. Clone repo ```git clone https://github.com/LuisMenjivar/todoapi.git```
(run ``` rm -rf .git ```  to remove git history )
2. Run ``` bundle install ```
3. Run ``` figaro instal ``` 
[Figaro](https://github.com/laserlemon/figaro)<br> is a gem that helps you manage sensitive information using ENV and a YML file.
   ```figaro install``` will create the YAML file named config/application.yml and will tell git to NOT track this file. Check  your .gitignore file to make sure that the file config/application.yml is included. You will put your sensitive information in config/application.yml in this form:   ```MAILGUN_SMTP_PASSWORD: 'your secret key' ```. Wherever you have to use ```your secret key``` you use it in this form using ENV:  ```ENV['MAILGUN_SMTP_PASSWORD']```
4. Run ```rake secret ```. This will give you a secret key that you will need to use devise. This is where the figaro gem is used. Put the secret key in config/application.yml ```DEVISE_SECRET_KEY: '$#$#$#$really_long_secret_key'```. I already put ```config.secret_key = ENV['DEVISE_SECRET_KEY']``` where devise needs it but if you want to check it is in app/config/initializers/devise.rb
5. Run ```rake seed``` again 
6. Run ```rake db:migrate``` to migrate databse. 
7. Run ```rake db:seed``` to create a seed data. More specifically a user with the email:  (standard@example.com)
and whose password is(helloworld). 
8. At this point you can start the Web rick server ```rails s``` and you should be able to sign in using: (standard@example) and (helloworld) as your password. However, you will not be able to sign up unless you configure the mailer.
9. In the file app/config/evironments/development.rb set ```config.action_mailer.perform_deliveries = false```
this will allow you to sign up as a new user, because the mailer wont acctivate a confirmation email. If you want to configure the mailer read on.
10. In the file app/config/evironments/development.rb leave ```config.action_mailer.perform_deliveries = true```.
The mailer I am using is mail gun which is an addon from heroku. 

Configuring with HEROKU.

I am assuming you have an account with Heroku. If not [Click here](https://signup.heroku.com/dc) to sign up and [Click here](https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up) to download their toolbelt. If you get stuck or if this is your first time using heroku [Click here](https://devcenter.heroku.com/start), for their getting started guide. Click on the Ruby guide. 

11. Run ```heroku create nameoftheapplication``` if you are not loged in, the console will prompt you to type your credentials (email and password). 
12. Now that there is an heroku application you can use the mail gun add-on. Run ```heroku addons:create mailgun``` to add mailgun to you heroku app.
13. Go to mailgun dashborad (here)[https://mailgun.com/app/dashboard] and get your credentials. They look like this: MAILGUN_SMTP_LOGIN: '#$#$%$3625longstring' MAILGUN_SMTP_PASSWORD: 'as53647longpassword'. Alternatelive, you can go to you heroku dashboard, click on your app, mail gun should be in your addons. Click mail gun and it will redirect you to the mailgun dashboard.
14. Go to your config/application.yml file and set your mailgun credentials like this:

```MAILGUN_SMTP_LOGIN: '$%^$%#3longstring'```

``` MAILGUN_SMTP_PASSWORD: '23478#$%#143longpassword'```
15. Run ```git push heroku master``` to push you local git to heroku.
16. Run ```heroku run rake db:migrate``` to migrate the data base in heroku.

At this point your application should be running well on production. 



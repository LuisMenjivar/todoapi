[Visit the production page here](https://luistodolist.herokuapp.com/users/sign_up)<br>

+ I am using the gem Devise for user authentication and Sendgrid for mail deliveries.

+ I am using Scheduler from heroku to run the rake task that deletes todos after 7 days after they are created. 

+ Users have only one todo list. Users have many todo items. Only using User and Todo models. 

+ Using figaro to hide username and passwords in application.yml folder. <br>

sign in as <br>
username:   standard@example.com<br>
password:   helloworld
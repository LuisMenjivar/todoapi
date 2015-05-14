[Visit the production page here](https://luistodoapi.herokuapp.com/)<br>

This is a simple API written in Ruby using the Rails framework. 

To get this api running:

1. Clone repo ```git clone https://github.com/LuisMenjivar/todoapi.git```
(run ``` rm -rf .git ```  to remove git history )
2. Run ``` bundle install ```
3. Run ``` figaro instal ``` [Figaro](https://github.com/laserlemon/figaro)<br> is a gem that helps you manage sensitive information using ENV and a YML file.
   ```figaro install``` will create the YAML hidden file in which you will put your sensitive information in this form:   ```MAILGUN_SMTP_PASSWORD: 'your secret key' ```. Wherever you have to use ```your secret key``` you use it in this form using ENV:  ```ENV['MAILGUN_SMTP_PASSWORD']```
4. Run ```rake db: ```

# README

ruby version : 2.7.3 <br>
rails version : 7.0.0 <br>

Heroku: https://warm-shelf-99986.herokuapp.com/?locale=zh-TW

# Model relation
**User Model**<br>
##### relation:<br>
User has_many Missions<br>
User has_many Group<br>
##### column:<br>
id<br>
name<br>
email<br>
password<br>
<br>
**Mission Model**<br>
##### relation:<br>
Mission belongs_to User<br>
Mission has_many Group<br>
##### column:<br>
id<br>
start_time<br>
end_time<br>
priority<br>
status<br>
title<br>
describe<br>
tag<br>
<br>
**Group Model**<br>
##### relation:<br>
Group belongs_to User<br>
Group belongs_to Mission<br>
##### column:<br>
id<br>
User_id<br>
Mission_id<br>
<br>

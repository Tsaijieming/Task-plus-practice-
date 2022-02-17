# README


Model relationship

User Model
relation:
User has_many Missions
User has_many Group
column:
id
name
email
password

Mission Model
relation:
Mission belongs_to User
Mission has_many Group
column:
id
start_time
end_time
priority
status
title
describe
tag


Group Model
relation:
Group belongs_to User
Group belongs_to Mission
column:
id
User_id
Mission_id


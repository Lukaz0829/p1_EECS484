INSERT INTO Users (user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender)
SELECT DISTINCT(user_id), first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender
FROM project1.Public_User_Information;

INSERT INTO User_Current_Cities (user_id, current_city_id)
SELECT DISTINCT(pu.user_id), Cities.city_id
FROM project1.Public_User_Information pu
JOIN Cities ON pu.current_city = Cities.city_name AND pu.current_state = Cities.state_name AND pu.current_country = Cities.country_name;

INSERT INTO User_Hometown_Cities(user_id, hometown_city_id)
SELECT DISTINCT(pu.user_id), Cities.city_id
FROM project1.Public_User_Information pu
INNER JOIN Cities ON pu.hometown_city = Cities.city_name AND pu.hometown_state = Cities.state_name AND pu.hometown_country = Cities.country_name;

INSERT INTO Cities (city_name, state_name, country_name)
SELECT DISTINCT current_city, current_state, current_country
FROM project1.Public_User_Information
UNION
SELECT DISTINCT hometown_city, hometown_state, hometown_country
FROM project1.Public_User_Information;

INSERT INTO Friends(user1_id, user2_id)
SELECT DISTINCT user1_id, user2_id
FROM project1.Public_Are_Friends
WHERE user1_id < user2_id;

INSERT INTO Programs(institution, concentration, degree)
SELECT DISTINCT institution_name, program_concentration, program_degree
FROM project1.Public_User_Information
WHERE institution_name IS NOT NULL;

INSERT INTO Education(user_id, program_id, program_year)
SELECT DISTINCT Users.user_id, Programs.program_id, pu.program_year
FROM project1.Public_User_Information pu
JOIN Users ON pu.user_id = Users.user_id
JOIN Programs ON pu.institution_name = Programs.institution
WHERE pu.institution_name IS NOT NULL;
ALTER TABLE ALBUMS DROP CONSTRAINT covered_by_photo;
DROP TABLE Tags;
DROP TABLE Photos;
DROP TABLE Albums;
DROP TABLE Participants;
DROP TABLE User_Events;
DROP TABLE Education;
DROP TABLE Programs;
DROP TABLE Messages;
DROP TABLE User_Hometown_Cities;
DROP TABLE User_Current_Cities;
DROP TABLE Cities;
DROP TABLE Friends;
DROP TABLE Users;

-- Drop sequences
DROP SEQUENCE user_id_seq;
DROP SEQUENCE city_id_seq;
DROP SEQUENCE program_id_seq;
DROP SEQUENCE event_id_seq;
DROP SEQUENCE album_id_seq;
DROP SEQUENCE photo_id_seq;
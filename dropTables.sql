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
DROP TABLE Tags CASCADE CONSTRAINTS;
DROP TABLE Photos CASCADE CONSTRAINTS;
DROP TABLE Albums CASCADE CONSTRAINTS;
DROP TABLE Participants CASCADE CONSTRAINTS;
DROP TABLE User_Events CASCADE CONSTRAINTS;
DROP TABLE Education

DROP SEQUENCE program_id_seq;
DROP SEQUENCE city_id_seq;
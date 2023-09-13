
-- Friends
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    year_of_birth INTEGER,
    month_of_birth INTEGER,
    day_of_birth INTEGER,
    gender VARCHAR2(100)
);
-- Friends
CREATE TABLE Friends (
    user1_id INTEGER NOT NULL,
    user2_id INTEGER NOT NULL,
    PRIMARY KEY (user1_id, user2_id),
    FOREIGN KEY (user1_id) REFERENCES Users(user_id),
    FOREIGN KEY (user2_id) REFERENCES Users(user_id)
);

CREATE TRIGGER Order_Friend_Pairs
    BEFORE INSERT ON Friends
    FOR EACH ROW
        DECLARE temp INTEGER;
        BEGIN
            IF :NEW.user1_id > :NEW.user2_id THEN
                temp := :NEW.user2_id;
                :NEW.user2_id := :NEW.user1_id;
                :NEW.user1_id := temp;
            END IF;
        END;
/


-- Cities
CREATE TABLE Cities (
    city_id INTEGER PRIMARY KEY,
    city_name VARCHAR2(100) NOT NULL,
    state_name VARCHAR2(100) NOT NULL,
    country_name VARCHAR2(100) NOT NULL,
    UNIQUE (city_name, state_name, country_name)
);

-- User_Current_Cities
CREATE TABLE User_Current_Cities (
    user_id INTEGER PRIMARY KEY,
    current_city_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (current_city_id) REFERENCES Cities(city_id)
);

-- User_Hometown_Cities
CREATE TABLE User_Hometown_Cities (
    user_id INTEGER PRIMARY KEY,
    hometown_city_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (hometown_city_id) REFERENCES Cities(city_id)
);

-- Messages
CREATE TABLE Messages (
    message_id INTEGER PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    message_content VARCHAR2(2000) NOT NULL,
    sent_time TIMESTAMP NOT NULL,
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id)
);

-- Programs
CREATE TABLE Programs (
    program_id INTEGER PRIMARY KEY,
    institution VARCHAR2(100) NOT NULL,
    concentration VARCHAR2(100) NOT NULL,
    degree VARCHAR2(100) NOT NULL,
    UNIQUE (institution, concentration, degree)
);

-- Education
CREATE TABLE Education (
    user_id INTEGER PRIMARY KEY,
    program_id INTEGER NOT NULL,
    program_year INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (program_id) REFERENCES Programs(program_id)
);

-- User_Events Table
CREATE TABLE User_Events (
    event_id INTEGER PRIMARY KEY,
    event_creator_id INTEGER NOT NULL,
    event_name VARCHAR2(100) NOT NULL,
    event_tagline VARCHAR2(100),
    event_description VARCHAR2(100),
    event_host VARCHAR2(100),
    event_type VARCHAR2(100),
    event_subtype VARCHAR2(100),
    event_address VARCHAR2(2000),
    event_city_id INTEGER NOT NULL,
    event_start_time TIMESTAMP,
    event_end_time TIMESTAMP,
    FOREIGN KEY (event_creator_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_city_id) REFERENCES Cities(city_id)
);

create table Participants(
    event_id INTEGER not null,
    user_id INTEGER not null,
    confirmation VARCHAR2(100) not null,
    primary key (event_id, user_id),
    FOREIGN KEY (event_id) REFERENCES User_Events(event_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

create table Albums(
    album_id INTEGER not null primary key,
    album_owner_id INTEGER not null,
    album_name VARCHAR2(100) not null,
    album_created_time TIMESTAMP not null,
    album_modified_time TIMESTAMP,
    album_link VARCHAR2(2000) not null,
    album_visibility VARCHAR2(100) not null,
    cover_photo_id INTEGER not null,
    foreign key (album_owner_id) references Users(user_id)
);

create table Photos(
    photo_id INTEGER not null primary key,
    album_id INTEGER not null,
    photo_caption VARCHAR2(2000),
    photo_created_time TIMESTAMP not null,
    photo_modified_time TIMESTAMP,
    photo_link VARCHAR2(2000) not null,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

create table Tags(
    tag_photo_id INTEGER not null,
    tag_subject_id INTEGER not null,
    tag_created_time TIMESTAMP not null,
    tag_x NUMBER not null,
    tag_y NUMBER not null,
    primary key (tag_photo_id, tag_subject_id),
    foreign key (tag_photo_id) references Photos(photo_id)
);

ALTER TABLE Albums
ADD CONSTRAINT covered_by_photo
FOREIGN KEY (cover_photo_id) REFERENCES Photos(photo_id)
INITIALLY DEFERRED DEFERRABLE;

CREATE SEQUENCE city_id_seq 
    START WITH 1 
    INCREMENT BY 1;
CREATE TRIGGER city_id_seq
    BEFORE INSERT ON Cities
    FOR EACH ROW
        BEGIN
            SELECT city_id_seq.NEXTVAL INTO :NEW.city_id FROM DUAL;
        END;
/
CREATE SEQUENCE program_id_seq 
    START WITH 1 
    INCREMENT BY 1;
CREATE TRIGGER program_id_seq 
    BEFORE INSERT ON Programs
    FOR EACH ROW
        BEGIN
            SELECT program_id_seq.NEXTVAL INTO :NEW.program_id FROM DUAL;
        END;
/
CREATE TABLE Users(
    user_id INTEGER PRIMARY KEY,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    year_of_birth INTEGER,
    month_of_birth INTEGER,
    day_of_birth INTEGER,
    gender VARCHAR2(100)
);

CREATE TABLE Cities(
    city_id INTEGER PRIMARY KEY,
    city_name VARCHAR2(100) NOT NULL,
    state_name VARCHAR2(100) NOT NULL,
    country_name VARCHAR2(100) NOT NULL
);

create table Programs(
    program_id INTEGER primary key,
    institution VARCHAR2(100) not null,
    concentration VARCHAR2(100) not null,
    degree VARCHAR2(100) not null
);

create table Education(
    user_id INTEGER not null,
    program_id INTEGER not null,
    program_year INTEGER not null,
    primary key (user_id, program_id),
    foreign key (user_id) references Users(user_id),
    foreign key (program_id) references Programs(program_id)
);

create table User_Events(
    event_id INTEGER primary key,
    event_creator_id INTEGER not null,
    event_name VARCHAR2(100),
    event_tagline VARCHAR2(100),
    event_description VARCHAR2(100),
    event_host VARCHAR2(100),
    event_type VARCHAR2(100),
    event_subtype VARCHAR2(100),
    event_address VARCHAR2(2000),
    event_city_id INTEGER not null,
    event_start_time TIMESTAMP,
    event_end_time TIMESTAMP,
    foreign key (event_creator_id) references Users(user_id),
    foreign key (event_city_id) references Cities(city_id)
);

create table Participants(
    event_id INTEGER not null,
    user_id INTEGER not null,
    confirmation VARCHAR2(100) not null,
    primary key (event_id, user_id)
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
    foreign key (album_owner_id) references Users(user_id),
    foreign key (cover_photo_id) references Photos(photo_id)
);

create table Photos(
    photo_id INTEGER not null primary key,
    album_id INTEGER not null,
    photo_caption VARCHAR2(2000),
    photo_created_time TIMESTAMP not null,
    photo_modified_time TIMESTAMP,
    photo_link VARCHAR2(2000) not null,
    foreign key (album_id) references Albums(album_id)
);
9
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

ALTER TABLE Photos
ADD CONSTRAINT photo_in_album
FOREIGN KEY (album_id) REFERENCES Albums(album_id)
INITIALLY DEFERRED DEFERRABLE;

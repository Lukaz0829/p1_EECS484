CREATE VIEW View_User_Information 
AS SELECT U.user_id, U.first_name, U.last_name, U.year_of_birth, U.month_of_birth, U.day_of_birth, U.gender,
       C1.city_name AS current_city, C1.state_name AS current_state, C1.country_name AS current_country,
       C2.city_name AS hometown_city, C2.state_name AS hometown_state, C2.country_name AS hometown_country,
       P.institution as institution_name, E.program_year, P.concentration as program concentration, P.degree as program_degree
FROM Users U, User_Current_Cities UC, User_Hometown_Cities UH, Cities C1, Cities C2, Programs P, Education E
WHERE U.user_id = UC.user_id AND UC.current_city_id = C1.city_id AND U.user_id = UH.user_id AND UH.hometown_city_id = C2.city_id AND U.user_id = E.user_id AND E.program_id = P.program_id;

CREATE VIEW View_Are_Friends 
AS SELECT Friends.user1_id, Friends.user2_id
FROM Friends;

CREATE VIEW View_Photo_Information as 
SELECT P.album_id, A.album_owner_id, A.cover_photo_id, A.album_name,
       A.album_created_time, A.album_modified_time, A.album_link,
       A.album_visibility, P.photo_id, P.photo_caption, P.photo_created_time,
       P.photo_modified_time, P.photo_link
FROM Photos P, Albums A
WHERE P.album_id = A.album_id;

CREATE VIEW View_Event_Information AS
SELECT E.event_id, E.event_creator_id, E.event_name, E.event_tagline, E.event_description, E.event_host,
    E.event_type, E.event_subtype, E.event_address, C.city_name AS event_city, C.state_name AS event_state, C.country_name AS event_country,
    E.event_start_time, E.event_end_time
FROM User_Events E, Cities C
WHERE E.event_city_id = C.city_id; 

CREATE VIEW View_Tag_Information AS
SELECT T.tag_photo_id, T.tag_subject_id, T.tag_created_time, T.tag_x, T.tag_y
FROM Tags T;
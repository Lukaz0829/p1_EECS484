CREATE VIEW View_User_Information 
AS SELECT U.user_id, U.first_name, U.last_name, U.year_of_birth, U.month_of_birth, U.day_of_birth, U.gender,
       UC.current_city, UC.current_state, UC.current_country,
       UH.hometown_city, UH.hometown_state, UH.hometown_country,
       P.institution_name, E.program_year, P.program_concentration, P.program_degree
FROM Users U, User_Current_Cities UC, User_Hometown_Cities UH, Programs P, Education E
WHERE U.user_id = UC.user_id AND U.user_id = UH.user_id AND U.user_id = E.user_id AND E.program_id = P.program_id;

CREATE VIEW View_Are_Friends 
AS SELECT Friends.user1_id, Friends.user2_id
FROM Friends;

CREATE VIEW View_Photo_Information 
AS SELECT P.photo_id, P.album_id, P.photo_caption, P.photo_created_time, P.photo_modified_time, P.photo_link,
       A.album_owner_id, A.album_name, A.album_created_time, A.album_modified_time, A.album_link, A.album_visibility, A.cover_photo_id
FROM Photos P, Albums A
WHERE P.album_id = A.album_id;

CREATE VIEW View_Event_Information AS
SELECT *
FROM Events;

CREATE VIEW View_Tag_Information AS
SELECT T.tag_photo_id, T.tag_subject_id, T.tag_created_time, T.tag_x, T.tag_y
FROM Tags T;
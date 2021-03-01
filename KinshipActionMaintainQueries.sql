##############################################################################
-- Queries to populate KinshipAction tables                                  -
--                                                                           -
-- Numbers refer to use cases for traceability                               -
--                                                                           -
-- This is NOT meant to be run straight through as a script.                 -
-- Use these queries as templates for queries submitted through the website. -
--                                                                           -
##############################################################################

-- -----------------------
-- 
-- 2.5 Maintain issues
-- 
-- Note - In order to assign issues to action groups and events
-- you have to populate the issue table first
-- 
-- -----------------------


-- 2.5.1 - Create issue

INSERT INTO issue (Name, Description)
VALUES ('Ageism',''),
('Air','air quality'),
('Animal protection','animal welfare, cruelty, vegetarianism, etc.'),
('Elections',''),
('Feminism',''),
('Heterosexism',''),
('Immigration',''),
('Indigenous','Welfare and rights of indigenous, native and first nations people'),
('Islamophobia',''),
('Land','Political and economic constraints on land use'),
('LGBTQAA+',''),
('Other',''),
('Permaculture','Care for the earth, care for the people, share the surplus'),
('Religious persecution',''),
('Sustainable farming',''),
('Trans rights',''),
('Water','') ,
('Climate change','')
;


-- 2.5.2 - Update issue

UPDATE issue 
   SET Description = "Discrimination against both old and young. Any discrimination on the basis of age."
   WHERE Name = 'Ageism';


-- 2.5.3 - Delete issue

DELETE FROM issue
 WHERE Name = 'Ageism' ;


-- --------------------------
-- 
-- 2.4 Maintain action groups
-- 
-- --------------------------

-- 2.4.1 - Create action group

INSERT INTO kgroup VALUES (
'Org1',
'The first organization',
'https://xyzzy.com/',
'We are doing everything all at once',
'We need lots of stuff',
'Local',
'Wakil David Matthews',
'drmatthewsusa@gmail.com',
'+1 123-456-7890',
'Yes',
'101 Main Street',
'',
'Seattle',
'WA',
'98101',
'USA',
47.493816 ,
-122.306862
);

INSERT INTO kgroup VALUES (
'Org2',
'The first organization',
'https://xyzzy.com/',
'We do it all day long',
'Chairs, tables, dishes, silverware',
'Local',
'Wakil David Matthews',
'drmatthewsusa@gmail.com',
'+1 123-456-7890',
'Yes',
'102 Main Street',
'',
'Seattle',
'WA',
'98101',
'USA',
0,
0
);

INSERT INTO kgroup VALUES (
'Org3',
'The third organization',
'https://xyzzy.com/',
'',
'',
'Regional',
'Sir Real',
'SirReal@null.com',
'+1 123-456-7890',
'Yes',
'',
'',
'',
'',
'',
'',
30.149748 ,
-97.814468
);

-- 2.4.2 - Update action group

UPDATE kgroup 
   SET Description = "The second organization"
   WHERE Name = "Org2";


-- 2.4.3 - Delete action group

DELETE FROM kgroup 
   WHERE Name = "Org3";



-- -----------------------------------------------------
-- 
-- Maintain groupissue
-- 
-- 2.4.1 - Create action group
-- This assigns issues to an action group as part of the 
-- process of creating the action group
-- 
-- -----------------------------------------------------

INSERT INTO groupissue (GroupName, issueName) VALUES
 ('Org1','Air') ,
 ('Org1','Elections')
;

INSERT INTO groupissue (GroupName, issueName) VALUES
 ('Org2','Air') ,
 ('Org2','Elections') ,
 ('Org2','Other')
;

INSERT INTO groupissue (GroupName, issueName) VALUES
 ('Org3','Permaculture') ,
 ('Org3','Sustainable Farming')
;

-- Update groupissue
-- Don't update the table as such. Delete and add rows as needed.

-- Delete from groupissue

DELETE FROM groupissue
 WHERE Groupname = 'Org3' ;



-- -----------------------------------------------------
-- 
-- 2.3 Maintain events
-- 
-- Note - In order to assign action groups to events you
-- have to populate the event table first
-- 
-- -----------------------------------------------------


-- 2.3.1 - Create Event

INSERT INTO kevent VALUES (
"Eating S'Mores",  # Note - if value contains single quote, use double quotes around it.
'Just a fun group activity involving graham crackers, marshmallows, chocolate and heat',
'2021-03-01 13:00:00',
'2021-03-01 15:00:00',
-7 ,
'PST' ,
'Chuckee Cheese',
'chuckee@null.org',
'999-123-4567',
'No',
'http://null.com/smores',
'At the picnic area in Waldorf Park, Bellingham',
'In-person',
'',
''
) ;

INSERT INTO kevent VALUES (
"Pacific Climate Warriors at the First People's Climate Summit Evening Panel",
'We invite you to join us at the events and activities 350.org is involved in at Bonn, or contact us for more information and media materials related to these events.',
'2021-04-02 20:00:00',
'2021-04-02 22:00:00',
-7 ,
'PST' ,'Wahhab Baldwin',
'wahhabb@gmail.com',
'+1 (206) 973-6751',
'Yes',
'https://pcs2017.org/en/evening-panels/',
'CAMPO Campusmensa Poppelsdorf',
'Hybrid',
47.493816 ,
-122.306862
);


INSERT INTO kevent VALUES (
'Event3',
'We invite you to join us.',
'2021-04-02 20:00:00',
'2021-04-02 22:00:00',
-5 ,
'PST' ,
'Wahhab Baldwin',
'wahhabb@gmail.com',
'+1 (206) 973-6751',
'Yes',
'',
'https://us02web.zoom.us/j/84620810012?pwd=MEtVWVdwaDU3eFpoQVA0NnMzQTMrZz09',
'Online',
30.149748 ,
-97.814468
);

INSERT INTO kevent VALUES (
'Event4',
'A big fat event',
'2021-04-02 20:00:00',
'2021-04-02 22:00:00',
-5 ,
'PST' ,
'Wahhab Baldwin',
'wahhabb@gmail.com',
'+1 (206) 973-6751',
'Yes',
'',
'https://us02web.zoom.us/j/84620810012?pwd=MEtVWVdwaDU3eFpoQVA0NnMzQTMrZz09',
'Online',
30.149748 ,
-97.814468
);


-- 2.3.2 - Update events

UPDATE kevent SET End = '2021-04-02 22:30:00' 
 WHERE Name = 'Event3' ;

-- 2.3.3 - Delete events

DELETE FROM kevent
 WHERE Name = 'Event3' ;


-- ---------------------------------------------------
-- 
-- Maintain groupevent
-- 
-- 2.3.1 - Create Event
-- This assigns action groups to events as part of the 
-- process of creating the event
-- 
-- ---------------------------------------------------

INSERT INTO groupevent (GroupName,EventName) VALUES (
'Org1',
"Eating S'Mores"
) ;

INSERT INTO groupevent (GroupName,EventName) VALUES (
'Org3',
"Eating S'Mores"
) ;

INSERT INTO groupevent (GroupName,EventName) VALUES (
'Org2',
"Pacific Climate Warriors at the First People's Climate Summit Evening Panel"
) ;

INSERT INTO groupevent (GroupName,EventName) VALUES (
'Org2',
"Event3"
) ;

INSERT INTO groupevent (GroupName,EventName) VALUES (
'Org1',
"Event3"
) ;

INSERT INTO groupevent (GroupName,EventName) VALUES (
'Org1',
"Event4"
) ;


-- Update groupevent
-- Don't update the table as such. Delete and add rows as needed.

-- Delete from groupevent

DELETE FROM groupevent
 WHERE Groupname = 'Org3' ;


-- ---------------------------------------------------
-- 
-- Maintain Eventissue
-- 
-- 2.3.1 - Create Event
-- This assigns issues to events as part of the 
-- process of creating the event
-- 
-- ---------------------------------------------------

INSERT INTO Eventissue (EventName,issueName) VALUES (
"Eating S'Mores",
'Elections'
) ;

INSERT INTO Eventissue (EventName,issueName) VALUES (
"Eating S'Mores",
'Feminism'
) ;

INSERT INTO Eventissue (EventName,issueName) VALUES (
"Pacific Climate Warriors at the First People's Climate Summit Evening Panel",
'Climate Change'
) ;

INSERT INTO Eventissue (EventName,issueName) VALUES (
'Event3',
'Indigenous'
) ;

INSERT INTO Eventissue (EventName,issueName) VALUES (
'Event3',
'Land'
) ;

INSERT INTO Eventissue (EventName,issueName) VALUES (
'Event4',
'Land'
) ;


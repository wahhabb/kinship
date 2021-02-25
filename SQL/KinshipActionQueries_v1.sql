-- ---------------------------------------------------------------------------
-- Queries to populate KinshipAction tables                                  -
--                                                                          -
-- Numbers refer to use cases for traceability                               -
--                                                                          -
-- This is NOT meant to be run straight through as a script.                 -
-- Use these queries as templates for queries submitted through the website. -
--                                                                          -
-- ---------------------------------------------------------------------------

-- ----------------------------------------------
--   Maintain - Create, update, delete
-- ----------------------------------------------

-- -----------------------
-- 
-- 2.5 Maintain issues
-- 
-- Note - In order to assign issues to action groups and events
-- you have to populate the issue table first
-- 
-- -----------------------


-- 2.5.1 - Create issue

INSERT INTO Issue (Name, Description)
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

UPDATE Issue 
   SET Description = "Discrimination against both old and young. Any discrimination on the basis of age."
   WHERE Name = 'Ageism';


-- 2.5.3 - Delete issue

DELETE FROM Issue
 WHERE Name = 'Ageism' ;


-- --------------------------
-- 
-- 2.4 Maintain action groups
-- 
-- --------------------------


-- 2.4.1 - Create action group

INSERT INTO KGroup VALUES (
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

INSERT INTO KGroup VALUES (
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

INSERT INTO KGroup VALUES (
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

UPDATE KGroup 
   SET Description = "The second organization"
   WHERE Name = "Org2";


-- 2.4.3 - Delete action group

DELETE FROM KGroup 
   WHERE Name = "Org3";



-- -----------------------------------------------------
-- 
-- Maintain GroupIssue
-- 
-- 2.4.1 - Create action group
-- This assigns issues to an action group as part of the 
-- process of creating the action group
-- 
-- -----------------------------------------------------

INSERT INTO GroupIssue (GroupName, IssueName) VALUES
 ('Org1','Air') ,
 ('Org1','Elections')
;

INSERT INTO GroupIssue (GroupName, IssueName) VALUES
 ('Org2','Air') ,
 ('Org2','Elections') ,
 ('Org2','Other')
;

INSERT INTO GroupIssue (GroupName, IssueName) VALUES
 ('Org3','Permaculture') ,
 ('Org3','Sustainable Farming')
;

-- Update GroupIssue
-- Don't update the table as such. Delete and add rows as needed.

-- Delete from GroupIssue

DELETE FROM GroupIssue
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

INSERT INTO KEvent VALUES (
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

INSERT INTO KEvent VALUES (
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


INSERT INTO KEvent VALUES (
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


-- 2.3.2 - Update events

UPDATE KEvent SET End = '2021-04-02 22:30:00' 
 WHERE Name = 'Event3' ;

-- 2.3.3 - Delete events

DELETE FROM KEvent
 WHERE Name = 'Event3' ;


-- ---------------------------------------------------
-- 
-- Maintain GroupEvent
-- 
-- 2.3.1 - Create Event
-- This assigns action groups to events as part of the 
-- process of creating the event
-- 
-- ---------------------------------------------------

INSERT INTO GroupEvent (GroupName,EventName) VALUES (
'Org1',
"Eating S'Mores"
) ;

INSERT INTO GroupEvent (GroupName,EventName) VALUES (
'Org3',
"Eating S'Mores"
) ;

INSERT INTO GroupEvent (GroupName,EventName) VALUES (
'Org2',
"Pacific Climate Warriors at the First People's Climate Summit Evening Panel"
) ;

INSERT INTO GroupEvent (GroupName,EventName) VALUES (
'Org2',
"Event3"
) ;

INSERT INTO GroupEvent (GroupName,EventName) VALUES (
'Org1',
"Event3"
) ;


-- Update GroupEvent
-- Don't update the table as such. Delete and add rows as needed.

-- Delete from GroupEvent

DELETE FROM GroupEvent
 WHERE Groupname = 'Org3' ;


-- ---------------------------------------------------
-- 
-- Maintain EventIssue
-- 
-- 2.3.1 - Create Event
-- This assigns issues to events as part of the 
-- process of creating the event
-- 
-- ---------------------------------------------------

INSERT INTO EventIssue (EventName,IssueName) VALUES (
"Eating S'Mores",
'Elections'
) ;

INSERT INTO EventIssue (EventName,IssueName) VALUES (
"Eating S'Mores",
'Feminism'
) ;

INSERT INTO EventIssue (EventName,IssueName) VALUES (
"Pacific Climate Warriors at the First People's Climate Summit Evening Panel",
'Climate Change'
) ;

INSERT INTO EventIssue (EventName,IssueName) VALUES (
'Event3',
'Indigenous'
) ;

INSERT INTO EventIssue (EventName,IssueName) VALUES (
'Event3',
'Land'
) ;



-- ----------------------------------------------
--   Display data
-- ----------------------------------------------

-- -----------------------
-- 
-- 2.1 Find events
-- 
-- -----------------------

-- 2.1.1 - Find Events

-- 2.2.2 - Sort Events

-- 2.1.3 - View Specific KEvent

SELECT KEvent.*, GroupEvent.GroupName FROM KEvent, GroupEvent
 WHERE KEvent.Name = 'Event3'
   AND GroupEvent.EventName = KEvent.Name ;

SELECT KEvent.Name, KEvent.Begin, GroupEvent.GroupName FROM KEvent, GroupEvent
 WHERE KEvent.Name = 'Event3'
   AND GroupEvent.EventName = KEvent.Name ;

SELECT KEvent.Name, KEvent.Begin, GroupEvent.GroupName
  FROM KEvent INNER JOIN GroupEvent
    ON GroupEvent.EventName = KEvent.Name
 WHERE KEvent.Name = 'Event3'
 ;

-- 2.2.1 - Find Action Groups

-- 2.2.2 - Sort Action Groups

-- 2.1.3 - View Specific Action Group



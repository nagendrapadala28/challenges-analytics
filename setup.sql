-- INPUT TABLES
CREATE TABLE dim_branch (
    branch_id VARCHAR(40)
    , name VARCHAR(50)
    , email VARCHAR(50)
    , city VARCHAR(50)
    , country VARCHAR(50)
    , timezone_id VARCHAR(50)
    , created_at DATE
);

CREATE TABLE dim_user (
    user_id VARCHAR(40)
    , branch_id VARCHAR(40)
    , name VARCHAR(50)
    , email VARCHAR(50)
    , created_at DATE
);

CREATE TABLE fct_credit_pack_purchases (
    user_id VARCHAR(40)
    , branch_id VARCHAR(40)
    , credit_pack_id VARCHAR(40)
    , credit_pack_purchased_at DATE
    , created_at DATE
    , credit_pack_purchase_details JSON
);

CREATE TABLE fct_membership_purchases (
    user_id VARCHAR(40)
    , branch_id VARCHAR(40)
    , membership_id VARCHAR(40)
    , membership_purchased_at DATE
    , created_at DATE
    , membership_purchase_details JSON
);

-- OUTPUT TABLES
CREATE TABLE fct_client_conversion_events (
     user_id VARCHAR(40)
     , branch_id VARCHAR(40)
     , local_user_created_at DATE
     , lead_status VARCHAR(40)
     , client_conversion_event_type VARCHAR(40)
     , client_conversion_event_id VARCHAR(40)
     , client_conversion_event_local_created_at DATE
     , client_conversion_event_name VARCHAR(40)
     , client_conversion_event_source VARCHAR(40)
     , first_user_membership_id VARCHAR(40)
     , first_local_membership_purchased_at DATE
     , first_membership_name VARCHAR(40)
     , first_membership_source VARCHAR(40)
     , first_credit_pack_id VARCHAR(40)
     , first_local_credit_pack_purchase_at DATE
     , first_credit_pack_name VARCHAR(40)
     , first_credit_pack_source VARCHAR(40)
);

CREATE TABLE fct_lead_conversions (
     user_id VARCHAR(40)
     , branch_id VARCHAR(40)
     , local_user_created_at DATE
     , lead_status VARCHAR(40)
     , client_conversion_event_type VARCHAR(40)
     , client_conversion_event_id VARCHAR(40)
     , client_conversion_event_local_created_at DATE
     , client_conversion_event_name VARCHAR(40)
     , client_conversion_event_source VARCHAR(40)
);


--INPUT DATA POPULATION (DO NOT EDIT)
INSERT INTO dim_branch (branch_id,"name",email,city,country,timezone_id,created_at) VALUES
     ('679d63bc-b896-480b-be7f-c48780872ba6','Trudeo','lyakuntsov0@reverbnation.com','Kiuola','Indonesia','Asia/Makassar','2024-05-13'),
     ('3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Eazzy','nbotting1@rambler.ru','Stary Sącz','Poland','Europe/Warsaw','2023-12-08'),
     ('183bf829-76c2-44c7-8a20-b5c8b073efcb','Livetube','slukehurst2@google.com.br','Pimian','China','Asia/Chongqing','2024-02-22'),
     ('dd588b33-76f9-4032-a754-6aa34e26de7b','Fivebridge','mseeman3@dailymotion.com','Kampunglistrik','Indonesia','Asia/Jakarta','2024-03-16'),
     ('2b94d71e-6311-4069-944f-d90c3206dc40','Zoombox','jbarham4@jimdo.com','Cleveland','United States','America/New_York','2024-05-09'),
     ('a32669e6-cd27-4ca6-ba5e-fa3971364fbc','Edgewire','hbigglestone5@kickstarter.com','Liberta','Antigua and Barbuda','America/Antigua','2024-02-29'),
     ('5b4a6b0f-5816-472e-9218-bb6b924f41b7','Rooxo','rgoreway6@wordpress.com','Maria Cristina','Philippines','Asia/Manila','2023-09-27'),
     ('8e447586-a7a6-4121-a81e-5d69d569306c','Thoughtstorm','mdwyr7@bloglovin.com','Guchang','China','Asia/Chongqing','2023-12-22'),
     ('45a46c12-d584-4b9f-9cd0-f164e6c2c5ef','Yamia','cfaulconbridge8@oaic.gov.au','Bunutan','Indonesia','Asia/Makassar','2024-05-28'),
     ('b1d15ee2-e3a7-4f42-8e19-125701ba5e64','Tazzy','gbawles9@twitpic.com','Botevgrad','Bulgaria','Europe/Sofia','2023-10-20');
INSERT INTO dim_branch (branch_id,"name",email,city,country,timezone_id,created_at) VALUES
     ('f197ce24-e657-4837-9fde-0fdc57203117','Voonyx','bthurlbournea@umn.edu','Dawu Chengguanzhen','China','Asia/Shanghai','2024-03-11'),
     ('65fa5b2a-c875-47d0-848e-9bbb027613ea','Oyonder','tbonnerb@nydailynews.com','‘Ibwayn','Palestinian Territory','Asia/Hebron','2023-11-23'),
     ('17faa88f-1198-4071-b553-76cf69008900','Tazzy','nwhitelockc@usatoday.com','Fuwah','Egypt','Africa/Cairo','2023-11-08'),
     ('755c1c16-1943-4872-9188-14d9d0240d76','Feedmix','kmainlandd@nationalgeographic.com','Tamel','Portugal','Europe/Lisbon','2023-11-08'),
     ('118b76a9-6fea-4a5d-982d-73ed2d5b0b53','Meevee','dmanwelle@oaic.gov.au','Sarreguemines','France','Europe/Paris','2023-09-25'),
     ('f0f0ca4a-0115-462a-ab1e-832f16a32e10','Photospace','dlaurentyf@cdbaby.com','Heqiao','China','Asia/Shanghai','2023-10-11'),
     ('eea6be43-1c0a-4683-9363-8cbb6a054ed0','Oyonder','rshovelg@reverbnation.com','Hengzhou','China','Asia/Chongqing','2023-08-08'),
     ('a6e63ae0-cc5c-4eb8-bd78-a6896003531c','Myworks','dgladerh@altervista.org','Nueva Requena','Peru','America/Lima','2024-05-30'),
     ('b41db116-9bcf-4c45-a89d-745c3b85cf38','Thoughtworks','eberntssoni@miibeian.gov.cn','Kolomyya','Ukraine','Europe/Uzhgorod','2024-04-18'),
     ('5c01d50b-5c7d-458c-b634-61a06047be2b','Aimbo','torsayj@moonfruit.com','Bulnes','Chile','America/Santiago','2023-08-22');
     
 
 
 
 INSERT INTO dim_user (user_id,branch_id,"name",email,created_at) VALUES
     ('348a9a95-f1a3-412d-9824-894cd77f1e3a','679d63bc-b896-480b-be7f-c48780872ba6','Jackquelin Astle','jastle4@edublogs.org','2023-04-03'),
     ('0d0bbdea-bc4e-41e6-86a3-38fc13f9933d','679d63bc-b896-480b-be7f-c48780872ba6','Sophie Pitway','spitwaye@ustream.tv','2023-04-03'),
     ('17d9c6e4-3ad0-4b3f-b032-b44291d8fdd1','679d63bc-b896-480b-be7f-c48780872ba6','Harriett Biesinger','hbiesingeri@harvard.edu','2023-04-03'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','Saloma Gouldie','sgouldies@amazonaws.com','2023-04-03'),
     ('152fdef4-cde2-4763-8ae2-138b6dc4dbcb','679d63bc-b896-480b-be7f-c48780872ba6','Corry Ary','caryt@ucsd.edu','2023-04-03'),
     ('2b5b6b54-0639-42fc-a16d-9dc374639005','679d63bc-b896-480b-be7f-c48780872ba6','Neille Matlock','nmatlock18@infoseek.co.jp','2023-04-03'),
     ('0cebe138-0e46-4312-9cc4-ec5dc8666a42','679d63bc-b896-480b-be7f-c48780872ba6','Antoni Valek','avalek1g@php.net','2023-04-03'),
     ('1c797c78-d1ee-4156-9138-78901e588bf0','679d63bc-b896-480b-be7f-c48780872ba6','Gualterio Bakewell','gbakewell1h@hibu.com','2023-04-03'),
     ('2653569d-07f8-4729-81e9-ef6a53d11b76','679d63bc-b896-480b-be7f-c48780872ba6','Fairfax McKomb','fmckomb1i@answers.com','2023-04-03'),
     ('1d5fdf23-e6a3-4e86-a740-22ad79eb67b9','679d63bc-b896-480b-be7f-c48780872ba6','Dore Riccardelli','driccardelli1j@blogger.com','2023-04-03');
INSERT INTO dim_user (user_id,branch_id,"name",email,created_at) VALUES
     ('08679488-5e64-40c9-8f1e-68670c1fcc12','679d63bc-b896-480b-be7f-c48780872ba6','Stephen Frugier','sfrugier1m@diigo.com','2023-04-03'),
     ('101637f3-b6b5-4b5d-9d60-8c05ed03c9d9','679d63bc-b896-480b-be7f-c48780872ba6','Lita Jozwicki','ljozwicki1q@discovery.com','2023-04-03'),
     ('0952aadb-1834-414c-bb94-756544803883','679d63bc-b896-480b-be7f-c48780872ba6','Merry Trenfield','mtrenfield1v@state.tx.us','2023-04-03'),
     ('10092407-3e42-4fff-862b-788635d26146','679d63bc-b896-480b-be7f-c48780872ba6','Greer Gibberd','ggibberd23@usgs.gov','2023-04-03'),
     ('010c83a8-5059-45ca-ace6-cdc9b150d2b6','679d63bc-b896-480b-be7f-c48780872ba6','Ilise MacKibbon','imackibbon25@webmd.com','2023-04-03'),
     ('2ae67883-12f5-441c-81bf-6b3ba94b71de','679d63bc-b896-480b-be7f-c48780872ba6','Tristam Beamont','tbeamont26@weibo.com','2023-04-03'),
     ('42f792d5-a5e2-40f5-b902-898c8da3b040','679d63bc-b896-480b-be7f-c48780872ba6','Lauretta Passman','lpassman2a@dmoz.org','2023-04-03'),
     ('24cd9888-b743-49d6-99e0-9dd290f93b7b','679d63bc-b896-480b-be7f-c48780872ba6','Sanderson Weedon','sweedon2e@amazon.com','2023-04-03'),
     ('3c67c06e-5feb-43c7-97bc-29754e602ec8','679d63bc-b896-480b-be7f-c48780872ba6','Darren Drinkale','ddrinkale2o@pagesperso-orange.fr','2023-04-03'),
     ('16ee9581-ca73-471b-902c-62b265dd654f','679d63bc-b896-480b-be7f-c48780872ba6','Dorelia McConnulty','dmcconnulty2p@smugmug.com','2023-04-03');
INSERT INTO dim_user (user_id,branch_id,"name",email,created_at) VALUES
     ('51372890-bb9c-4f47-ab23-83d1411aead1','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Dayle Egalton','degalton3@gmpg.org','2023-04-03'),
     ('56f7f1af-c9ba-4fd3-b8b9-4068ac2fe5c3','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Berna Cannicott','bcannicott6@miibeian.gov.cn','2023-04-03'),
     ('47c8a66c-1f67-49c4-b275-86d357254c35','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Dolf Beslier','dbeslier7@ning.com','2023-04-03'),
     ('6534cb41-6517-4ef9-a84c-5685ee6f719d','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Ula Olding','uolding9@google.com.br','2023-04-03'),
     ('4e4f2a4b-0697-4ef6-ad53-1094c1c181b6','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Tyne Shillington','tshillingtong@lulu.com','2023-04-03'),
     ('5dcad327-7a64-450e-89fd-d6047499d84a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Stormi Sollas','ssollash@dmoz.org','2023-04-03'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Fax Marden','fmardenj@cdc.gov','2023-04-03'),
     ('5b8856d8-f1b2-4cd9-baf5-46c37a6130ed','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Eyde Buske','ebuskel@hubpages.com','2023-04-03'),
     ('5213812f-8929-4f7d-9e1f-ce618613460c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Verney Gillebert','vgillebertm@springer.com','2023-04-03'),
     ('6a388309-2818-4170-8909-3167eb82df1e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Rozina O''Gavin','rogavinq@geocities.jp','2023-04-03');
INSERT INTO dim_user (user_id,branch_id,"name",email,created_at) VALUES
     ('5d4f5cc4-f636-496a-953b-975485db9258','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Gerianna Parkman','gparkmanv@bing.com','2023-04-03'),
     ('52b1a258-b7ab-49d3-a7e5-af564a3cd20a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Jessalyn Bohey','jboheyw@engadget.com','2023-04-03'),
     ('4afd9e20-2e32-47de-a59b-a485fa333b0b','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Brigitte Longhorne','blonghorne12@comsenz.com','2023-04-03'),
     ('546101da-27f9-4d36-849a-2ff3665800ea','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Thadeus Benettolo','tbenettolo14@ebay.co.uk','2023-04-03'),
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Dante Parffrey','dparffrey19@nba.com','2023-04-03'),
     ('5dc072a6-d336-46a9-803f-3ecc4e5fdcaf','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Nani Valencia','nvalencia1e@goodreads.com','2023-04-03'),
     ('5a8223b4-ca9f-4698-ac36-bdc6d3f0bc66','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Margaret Heimann','mheimann1t@dagondesign.com','2023-04-03'),
     ('5ab65223-ff3e-4d46-b3b4-2ecb9e68add9','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Salomi Utley','sutley29@cargocollective.com','2023-04-03'),
     ('50da1ec7-c569-41b9-abac-1559cb7ac89c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Cecily Mankor','cmankor2g@istockphoto.com','2023-04-03'),
     ('6c06a496-88a8-40c0-a3f5-fa590c73b2fa','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','Joelie Layzell','jlayzell2k@loc.gov','2023-04-03');
INSERT INTO dim_user (user_id,branch_id,"name",email,created_at) VALUES
     ('a2db8651-cf91-4310-a717-1ebb8074950f','183bf829-76c2-44c7-8a20-b5c8b073efcb','Eugenio Collingwood','ecollingwood0@jigsy.com','2023-04-03'),
     ('968aaa29-7b8e-4adb-bcfe-0c3f0154c68f','183bf829-76c2-44c7-8a20-b5c8b073efcb','Valeda Gauchier','vgauchier2@bbc.co.uk','2023-04-03'),
     ('79b97c21-87e5-49e5-80a6-0ff60e1a40d4','183bf829-76c2-44c7-8a20-b5c8b073efcb','Natalya Blenkinsopp','nblenkinsoppf@photobucket.com','2023-04-03'),
     ('7e8795e8-325f-4e65-970a-e58430316ea7','183bf829-76c2-44c7-8a20-b5c8b073efcb','Penn Dilks','pdilksr@guardian.co.uk','2023-04-03'),
     ('875a9117-fd70-4f90-902a-91c04a7e6727','183bf829-76c2-44c7-8a20-b5c8b073efcb','Leroi Mallall','lmallallu@examiner.com','2023-04-03'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','Lief Oxbe','loxbe10@salon.com','2023-04-03'),
     ('7280906d-97fa-479f-b257-c9f2d7bfb6ba','183bf829-76c2-44c7-8a20-b5c8b073efcb','Galvan Merdew','gmerdew17@fastcompany.com','2023-04-03'),
     ('9e0fdce5-e985-4fca-991f-6cc8eccc65f5','183bf829-76c2-44c7-8a20-b5c8b073efcb','Adrienne McEntee','amcentee1f@nhs.uk','2023-04-03'),
     ('77b23c41-48c9-4493-bbf2-40db442cb444','183bf829-76c2-44c7-8a20-b5c8b073efcb','Standford Accomb','saccomb1k@ed.gov','2023-04-03'),
     ('993ff139-1fb7-4da7-98e0-62eff86a96e7','183bf829-76c2-44c7-8a20-b5c8b073efcb','Kylila Biernacki','kbiernacki1l@yolasite.com','2023-04-03');
INSERT INTO dim_user (user_id,branch_id,"name",email,created_at) VALUES
     ('7643d20f-356c-4f8b-a909-7b9c1815ca95','183bf829-76c2-44c7-8a20-b5c8b073efcb','Talbot Gudgion','tgudgion1n@amazon.com','2023-04-03'),
     ('8d26c0ec-2fcd-4080-a114-3b568ff4224b','183bf829-76c2-44c7-8a20-b5c8b073efcb','Ebeneser Gaffney','egaffney1p@about.me','2023-04-03'),
     ('95a709f1-954d-4531-853b-1a7c9567516e','183bf829-76c2-44c7-8a20-b5c8b073efcb','Leonerd Kirtlan','lkirtlan1u@hao123.com','2023-04-03'),
     ('85041be6-cf8d-4194-8aaf-72ef4122002a','183bf829-76c2-44c7-8a20-b5c8b073efcb','Radcliffe Murtagh','rmurtagh1x@hubpages.com','2023-04-03'),
     ('9ef92827-bbf9-4924-b91d-40b5e0ccd5f6','183bf829-76c2-44c7-8a20-b5c8b073efcb','Lian Chaudret','lchaudret2c@nymag.com','2023-04-03'),
     ('70ae8751-489d-4c64-9197-a80e93498e6e','183bf829-76c2-44c7-8a20-b5c8b073efcb','Farra Castanone','fcastanone2h@shutterfly.com','2023-04-03'),
     ('82cd1bb4-f8cf-49fd-8cac-104fc0cbb024','183bf829-76c2-44c7-8a20-b5c8b073efcb','Boris Perree','bperree2i@artisteer.com','2023-04-03'),
     ('a1562999-410e-466e-9d01-11c2f0846077','183bf829-76c2-44c7-8a20-b5c8b073efcb','Barbi Walklett','bwalklett2m@slate.com','2023-04-03'),
     ('89e7214a-055d-45d6-ad43-cc091da33ca2','183bf829-76c2-44c7-8a20-b5c8b073efcb','Marco Olner','molner2n@shinystat.com','2023-04-03'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','Berty Perceval','bperceval2q@yandex.ru','2023-04-03');
INSERT INTO dim_user (user_id,branch_id,"name",email,created_at) VALUES
     ('d66b2d2c-023c-48df-b3e3-4f79841d10aa','dd588b33-76f9-4032-a754-6aa34e26de7b','Adda Tetley','atetley5@ted.com','2023-04-03'),
     ('a309ddfd-b618-4adb-8f29-2fd427e3ad09','dd588b33-76f9-4032-a754-6aa34e26de7b','Nelson Sings','nsings8@google.pl','2023-04-03'),
     ('adcd90cd-e764-4fe8-8c26-9e0aa21cb017','dd588b33-76f9-4032-a754-6aa34e26de7b','Laurice Feak','lfeakb@tinyurl.com','2023-04-03'),
     ('c849f32a-85f8-4455-bd20-ddf29cbd187a','dd588b33-76f9-4032-a754-6aa34e26de7b','Janean Fayerbrother','jfayerbrothern@yahoo.com','2023-04-03'),
     ('b06251b8-a11b-4e92-8c79-2f57cacd59ec','dd588b33-76f9-4032-a754-6aa34e26de7b','Jermayne Spybey','jspybeyo@drupal.org','2023-04-03'),
     ('bc2ea856-1419-4265-885a-77cb5f8965e0','dd588b33-76f9-4032-a754-6aa34e26de7b','Maris Clausius','mclausiusx@chron.com','2023-04-03'),
     ('cce41f90-6648-4ae2-bd07-baca6e46c154','dd588b33-76f9-4032-a754-6aa34e26de7b','Gilbertine Kitchenham','gkitchenhamy@discovery.com','2023-04-03'),
     ('d7455936-559f-403b-8a1e-418be08ec623','dd588b33-76f9-4032-a754-6aa34e26de7b','Rikki Littlefair','rlittlefair13@cnbc.com','2023-04-03'),
     ('c991a456-859a-4f5f-8864-97a682c519a3','dd588b33-76f9-4032-a754-6aa34e26de7b','Cecilia Missen','cmissen16@pinterest.com','2023-04-03'),
     ('bd2edd61-412a-433a-9d5a-e3096ee943db','dd588b33-76f9-4032-a754-6aa34e26de7b','Ad Ennew','aennew1a@bravesites.com','2023-04-03');
INSERT INTO dim_user (user_id,branch_id,"name",email,created_at) VALUES
     ('a47212ba-9472-4921-95a3-55adb48b6ada','dd588b33-76f9-4032-a754-6aa34e26de7b','Verene Showte','vshowte1b@weather.com','2023-04-03'),
     ('d772aa6a-990c-4a23-83b8-5fb43148df36','dd588b33-76f9-4032-a754-6aa34e26de7b','Burnard Jackling','bjackling1d@gravatar.com','2023-04-03'),
     ('b7785474-5afb-4618-9782-96091131cca4','dd588b33-76f9-4032-a754-6aa34e26de7b','Eduino Lockhart','elockhart1o@si.edu','2023-04-03'),
     ('a55211af-ebef-4ac7-bac9-be25c2ea3820','dd588b33-76f9-4032-a754-6aa34e26de7b','Haily Hadgraft','hhadgraft1w@comcast.net','2023-04-03'),
     ('b9c36c7f-dd96-44f8-88f8-ffdf6be81344','dd588b33-76f9-4032-a754-6aa34e26de7b','Roland Shercliff','rshercliff1y@google.com.au','2023-04-03'),
     ('c83a56d6-c676-43dc-a858-d3aa801bbf61','dd588b33-76f9-4032-a754-6aa34e26de7b','Trish Moquin','tmoquin24@usgs.gov','2023-04-03'),
     ('ab2532fd-4844-43a0-831a-b2ffa9a3ffba','dd588b33-76f9-4032-a754-6aa34e26de7b','Avrit Greedyer','agreedyer2d@tinyurl.com','2023-04-03'),
     ('c2152a68-b0a0-45ac-88a8-ceea7947948e','dd588b33-76f9-4032-a754-6aa34e26de7b','Granger Duplain','gduplain2f@issuu.com','2023-04-03'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','Hart Spick','hspick2l@xrea.com','2023-04-03'),
     ('a3a9ee53-9c57-42e3-8d4f-147e4881dce7','dd588b33-76f9-4032-a754-6aa34e26de7b','Wilma Trodden','wtrodden2r@canalblog.com','2023-04-03');
INSERT INTO dim_user (user_id,branch_id,"name",email,created_at) VALUES
     ('dd36cf94-b0ec-490a-acd8-1a99a6686601','2b94d71e-6311-4069-944f-d90c3206dc40','Farra Krauze','fkrauze1@cbsnews.com','2023-04-03'),
     ('fbaddd3a-4116-40ea-a8ac-52aab1849697','2b94d71e-6311-4069-944f-d90c3206dc40','Leilah Howbrook','lhowbrooka@harvard.edu','2023-04-03'),
     ('eb8539e3-7f81-4399-9872-6c8406858054','2b94d71e-6311-4069-944f-d90c3206dc40','Mile Hubber','mhubberc@reference.com','2023-04-03'),
     ('f4684124-04b3-4762-a272-8530f3d7c8a1','2b94d71e-6311-4069-944f-d90c3206dc40','Kiel Ruckman','kruckmand@hostgator.com','2023-04-03'),
     ('fd1c3dfc-c0e6-4cc2-bab7-c67e026bb939','2b94d71e-6311-4069-944f-d90c3206dc40','Andeee Hartfield','ahartfieldk@microsoft.com','2023-04-03'),
     ('f3870de4-1893-4518-8007-4892dc227872','2b94d71e-6311-4069-944f-d90c3206dc40','Salomo Faichney','sfaichneyp@phpbb.com','2023-04-03'),
     ('e56e4383-5fed-4155-9a42-5d722b60e90d','2b94d71e-6311-4069-944f-d90c3206dc40','Jacquenetta Maillard','jmaillardz@flickr.com','2023-04-03'),
     ('e8340470-366b-40b8-80e3-d36fb59cf325','2b94d71e-6311-4069-944f-d90c3206dc40','Rip Fannon','rfannon11@livejournal.com','2023-04-03'),
     ('ecbf341c-5c25-48c0-9347-b2a94f498fbb','2b94d71e-6311-4069-944f-d90c3206dc40','Emma Tesoe','etesoe15@printfriendly.com','2023-04-03'),
     ('eb771fd1-d7c7-4ca5-ac40-a797f7a87e08','2b94d71e-6311-4069-944f-d90c3206dc40','Jesus Soppit','jsoppit1c@miibeian.gov.cn','2023-04-03');
INSERT INTO dim_user (user_id,branch_id,"name",email,created_at) VALUES
     ('da1909ce-a694-43d8-9a4d-b9e2e825269c','2b94d71e-6311-4069-944f-d90c3206dc40','Mellisent Legg','mlegg1r@ucla.edu','2023-04-03'),
     ('e2ec7e1b-4980-4e60-8805-03293530cc37','2b94d71e-6311-4069-944f-d90c3206dc40','Clarita Mundall','cmundall1s@webs.com','2023-04-03'),
     ('f12147b1-8d2b-471a-b2a3-81d1c5f31c11','2b94d71e-6311-4069-944f-d90c3206dc40','Madelyn Hewell','mhewell1z@reuters.com','2023-04-03'),
     ('d895a409-9f03-43c0-946d-a9b1717afdc0','2b94d71e-6311-4069-944f-d90c3206dc40','Ailina Stockey','astockey20@wikispaces.com','2023-04-03'),
     ('f8b3eac7-fd48-4d8d-abf9-87eb94f7ed98','2b94d71e-6311-4069-944f-d90c3206dc40','Elga Pollock','epollock21@time.com','2023-04-03'),
     ('dfc13311-c09a-4485-872e-7b4411fb23a1','2b94d71e-6311-4069-944f-d90c3206dc40','Nicholas Holwell','nholwell22@sourceforge.net','2023-04-03'),
     ('ed88f150-de85-4b7e-b40e-dae8d3666365','2b94d71e-6311-4069-944f-d90c3206dc40','Gabbey Clout','gclout27@cpanel.net','2023-04-03'),
     ('fa99041b-810d-4486-9689-ef904e7e56a3','2b94d71e-6311-4069-944f-d90c3206dc40','Rutherford Lloyd','rlloyd28@joomla.org','2023-04-03'),
     ('f8a48090-57fc-4dc0-a435-54fb78a304eb','2b94d71e-6311-4069-944f-d90c3206dc40','Becca Stidston','bstidston2b@hubpages.com','2023-04-03'),
     ('fac87498-7b32-48e5-842d-8f6e8a753b0e','2b94d71e-6311-4069-944f-d90c3206dc40','Norri Dorey','ndorey2j@bbc.co.uk','2023-04-03');
 
 

 INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('51372890-bb9c-4f47-ab23-83d1411aead1','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','af5b7ccb-8185-4ecd-9044-1af80d4472ce','2023-11-28','2023-08-20','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('0952aadb-1834-414c-bb94-756544803883','679d63bc-b896-480b-be7f-c48780872ba6','afb00a6d-03a1-4972-928e-1018d18f4c39','2023-08-04','2023-08-05','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('2b5b6b54-0639-42fc-a16d-9dc374639005','679d63bc-b896-480b-be7f-c48780872ba6','3dfeaff8-b31d-4eb4-b44a-cdc6a531e797','2024-04-10','2024-01-31','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('d66b2d2c-023c-48df-b3e3-4f79841d10aa','dd588b33-76f9-4032-a754-6aa34e26de7b','9fa20e26-7855-466d-ade5-950d4d0af0c4','2023-11-30','2023-07-17','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('8d26c0ec-2fcd-4080-a114-3b568ff4224b','183bf829-76c2-44c7-8a20-b5c8b073efcb','0a717df8-22d2-4498-b99f-d79fc5e13b1b','2023-07-12','2024-06-29','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('c83a56d6-c676-43dc-a858-d3aa801bbf61','dd588b33-76f9-4032-a754-6aa34e26de7b','c5e4925e-d1ac-460d-a0c0-bb09f8aea242','2024-07-09','2023-10-06','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('b06251b8-a11b-4e92-8c79-2f57cacd59ec','dd588b33-76f9-4032-a754-6aa34e26de7b','43aab03c-74b4-41c6-8621-89d788ee4f5b','2023-08-27','2023-09-18','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('6534cb41-6517-4ef9-a84c-5685ee6f719d','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','5e141fe2-351d-4f8e-8477-b02a0d9de61b','2024-04-03','2024-06-16','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('5ab65223-ff3e-4d46-b3b4-2ecb9e68add9','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','2af70faa-f0c8-49d8-955b-329d797805b2','2023-12-29','2023-10-06','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('968aaa29-7b8e-4adb-bcfe-0c3f0154c68f','183bf829-76c2-44c7-8a20-b5c8b073efcb','22290c92-7d0d-47f9-9a1a-b1796bf4b0ea','2024-04-12','2023-08-12','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('77b23c41-48c9-4493-bbf2-40db442cb444','183bf829-76c2-44c7-8a20-b5c8b073efcb','3147ceaa-3e95-4de1-9fb4-51fbf7bdcd52','2023-10-19','2024-02-08','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('4afd9e20-2e32-47de-a59b-a485fa333b0b','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','69029be9-6601-4c10-83a2-5450648ab0cb','2023-09-05','2024-05-07','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('5b8856d8-f1b2-4cd9-baf5-46c37a6130ed','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','bbd2144a-c46f-426f-9d34-1f9c7a8469fa','2023-07-29','2024-02-14','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('b9c36c7f-dd96-44f8-88f8-ffdf6be81344','dd588b33-76f9-4032-a754-6aa34e26de7b','406ed589-42b5-4b6d-a339-8c8beac462a6','2023-09-22','2023-11-04','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('1d5fdf23-e6a3-4e86-a740-22ad79eb67b9','679d63bc-b896-480b-be7f-c48780872ba6','76f8025c-b886-41dd-b17b-5ae34861f124','2024-03-03','2024-01-19','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('79b97c21-87e5-49e5-80a6-0ff60e1a40d4','183bf829-76c2-44c7-8a20-b5c8b073efcb','1e3f02da-958e-4686-a7ad-c211bcc3e715','2023-07-11','2023-12-04','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('77b23c41-48c9-4493-bbf2-40db442cb444','183bf829-76c2-44c7-8a20-b5c8b073efcb','4dd04984-2793-4456-b60e-07420f9b057c','2024-01-08','2023-12-15','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('cce41f90-6648-4ae2-bd07-baca6e46c154','dd588b33-76f9-4032-a754-6aa34e26de7b','c83712c8-2467-4e4c-960a-ae72d45ac103','2024-05-08','2024-04-09','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('0d0bbdea-bc4e-41e6-86a3-38fc13f9933d','679d63bc-b896-480b-be7f-c48780872ba6','956303c7-b777-4568-9351-7de90c1a0e3a','2023-08-08','2023-09-25','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('1d5fdf23-e6a3-4e86-a740-22ad79eb67b9','679d63bc-b896-480b-be7f-c48780872ba6','064b100e-2c6f-4bf0-81d7-e14d6d91486c','2023-10-22','2024-05-06','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('3c67c06e-5feb-43c7-97bc-29754e602ec8','679d63bc-b896-480b-be7f-c48780872ba6','28ea0ece-19c8-47b9-8601-cbddb966cd51','2024-01-03','2023-08-21','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('8d26c0ec-2fcd-4080-a114-3b568ff4224b','183bf829-76c2-44c7-8a20-b5c8b073efcb','b7b2b076-715e-4961-babb-8110e5f875f9','2023-07-15','2023-12-11','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('010c83a8-5059-45ca-ace6-cdc9b150d2b6','679d63bc-b896-480b-be7f-c48780872ba6','e986c5c0-de09-4045-92c1-a3481d7fa769','2024-01-31','2023-09-25','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('2ae67883-12f5-441c-81bf-6b3ba94b71de','679d63bc-b896-480b-be7f-c48780872ba6','4d8837f6-f907-4413-9fd2-6e755a7ebd32','2023-11-02','2023-09-23','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','217428eb-289f-4c78-a73d-3ed724fb16f2','2024-02-18','2024-01-18','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('ab2532fd-4844-43a0-831a-b2ffa9a3ffba','dd588b33-76f9-4032-a754-6aa34e26de7b','1f5a98f2-915e-4b49-9024-9c530d115713','2024-04-18','2023-11-13','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('1c797c78-d1ee-4156-9138-78901e588bf0','679d63bc-b896-480b-be7f-c48780872ba6','505293b7-ed1f-45ba-817e-6e867095ddef','2023-09-18','2023-07-19','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('c849f32a-85f8-4455-bd20-ddf29cbd187a','dd588b33-76f9-4032-a754-6aa34e26de7b','68234a13-935a-4422-9c30-41d0b6afb639','2023-08-27','2024-04-22','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('5dcad327-7a64-450e-89fd-d6047499d84a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','57830b04-8284-4296-84b2-6597083f1a2e','2023-11-17','2023-09-07','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('101637f3-b6b5-4b5d-9d60-8c05ed03c9d9','679d63bc-b896-480b-be7f-c48780872ba6','1e5e865f-9429-45b9-aac5-b103efad796a','2023-08-18','2023-10-15','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('d772aa6a-990c-4a23-83b8-5fb43148df36','dd588b33-76f9-4032-a754-6aa34e26de7b','98a68525-e22a-4745-976e-9ed2cf7cf1aa','2023-11-01','2024-03-17','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('85041be6-cf8d-4194-8aaf-72ef4122002a','183bf829-76c2-44c7-8a20-b5c8b073efcb','6fecfe5c-1e66-4f33-8f3d-ffa31a5b5c29','2024-04-19','2023-09-20','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('348a9a95-f1a3-412d-9824-894cd77f1e3a','679d63bc-b896-480b-be7f-c48780872ba6','8dcdebd0-d299-431a-951c-078eddb946d0','2024-04-24','2024-05-20','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('adcd90cd-e764-4fe8-8c26-9e0aa21cb017','dd588b33-76f9-4032-a754-6aa34e26de7b','72615535-bdb4-47d2-b14c-dec5bb341d45','2023-12-08','2023-09-14','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('4e4f2a4b-0697-4ef6-ad53-1094c1c181b6','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','2dd854ba-e0c9-4afa-bddc-b6e7c99ed74e','2024-03-07','2024-04-16','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('4afd9e20-2e32-47de-a59b-a485fa333b0b','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','b32ad086-50c2-48ef-8933-311c1a64b1e3','2024-02-04','2023-12-05','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','e963ded9-170e-4593-8ab5-a2c3f33c092d','2024-02-21','2023-10-23','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('0d0bbdea-bc4e-41e6-86a3-38fc13f9933d','679d63bc-b896-480b-be7f-c48780872ba6','6e828549-b755-4d8a-a1d9-edcb37a24f02','2023-07-27','2023-08-03','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('cce41f90-6648-4ae2-bd07-baca6e46c154','dd588b33-76f9-4032-a754-6aa34e26de7b','552c2946-9865-44e7-97b0-ac28acaea32d','2024-02-22','2024-03-02','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('0cebe138-0e46-4312-9cc4-ec5dc8666a42','679d63bc-b896-480b-be7f-c48780872ba6','359637cb-7bfb-4cb8-80cf-5b23d0e62609','2024-07-07','2024-02-18','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('b06251b8-a11b-4e92-8c79-2f57cacd59ec','dd588b33-76f9-4032-a754-6aa34e26de7b','6cc2938e-33fe-4484-ab4c-f9b1bc286349','2024-06-16','2024-01-04','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('a55211af-ebef-4ac7-bac9-be25c2ea3820','dd588b33-76f9-4032-a754-6aa34e26de7b','a45bfb65-41cb-4751-bfb8-686f944b205d','2024-04-15','2023-12-07','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('b9c36c7f-dd96-44f8-88f8-ffdf6be81344','dd588b33-76f9-4032-a754-6aa34e26de7b','44f30ef7-d48e-44a0-95f1-03e98b810c76','2024-03-09','2024-06-03','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('5dc072a6-d336-46a9-803f-3ecc4e5fdcaf','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','1d72623f-2015-4b88-a0f5-39754518c9ea','2024-02-08','2023-09-05','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('08679488-5e64-40c9-8f1e-68670c1fcc12','679d63bc-b896-480b-be7f-c48780872ba6','a256f94f-9420-40b9-b6ae-9cbe194c76e7','2023-07-16','2023-10-17','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('82cd1bb4-f8cf-49fd-8cac-104fc0cbb024','183bf829-76c2-44c7-8a20-b5c8b073efcb','e382520f-de43-4d6b-91cd-b691e0897eb3','2024-05-29','2023-09-11','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('101637f3-b6b5-4b5d-9d60-8c05ed03c9d9','679d63bc-b896-480b-be7f-c48780872ba6','b8d8eaa4-72af-45da-b605-1f8e37b7e8bc','2024-01-03','2023-11-22','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('b06251b8-a11b-4e92-8c79-2f57cacd59ec','dd588b33-76f9-4032-a754-6aa34e26de7b','c2814de9-2eaf-4cc2-971c-f8ba45bbc95d','2023-08-18','2023-07-25','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('b7785474-5afb-4618-9782-96091131cca4','dd588b33-76f9-4032-a754-6aa34e26de7b','f41d43e3-7413-4efa-9ac8-b45251d43a65','2024-01-04','2023-09-05','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('89e7214a-055d-45d6-ad43-cc091da33ca2','183bf829-76c2-44c7-8a20-b5c8b073efcb','ec9d3ef5-dc68-40de-8c1a-4d4475721990','2024-06-11','2024-03-08','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('c2152a68-b0a0-45ac-88a8-ceea7947948e','dd588b33-76f9-4032-a754-6aa34e26de7b','9a2a8d58-9d97-42f0-b0fa-a84b8e16f6ec','2023-12-30','2024-05-26','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('9e0fdce5-e985-4fca-991f-6cc8eccc65f5','183bf829-76c2-44c7-8a20-b5c8b073efcb','073078e3-41ff-486a-acd2-7d305ae86cfb','2023-12-16','2024-05-03','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('2ae67883-12f5-441c-81bf-6b3ba94b71de','679d63bc-b896-480b-be7f-c48780872ba6','36bbacaa-8882-4e19-a945-002060fe2418','2023-12-19','2023-10-04','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('5dc072a6-d336-46a9-803f-3ecc4e5fdcaf','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','2bed30f1-ef1c-4a87-b23d-6eb88e49baa3','2024-02-12','2024-06-21','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('77b23c41-48c9-4493-bbf2-40db442cb444','183bf829-76c2-44c7-8a20-b5c8b073efcb','26a826ce-2098-49cc-8828-76dbed2385cf','2023-07-27','2024-03-29','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a47212ba-9472-4921-95a3-55adb48b6ada','dd588b33-76f9-4032-a754-6aa34e26de7b','cfb955d2-4376-4666-af26-706810918210','2023-11-08','2024-06-04','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('0952aadb-1834-414c-bb94-756544803883','679d63bc-b896-480b-be7f-c48780872ba6','dac67ed1-ea6f-4980-af9d-91a8c63dc408','2024-03-04','2023-07-23','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('4afd9e20-2e32-47de-a59b-a485fa333b0b','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','0c23d7a3-931c-45e7-afcc-66b1faec3510','2023-09-24','2024-05-03','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('bd2edd61-412a-433a-9d5a-e3096ee943db','dd588b33-76f9-4032-a754-6aa34e26de7b','4b3951b4-d5e0-4a6e-8173-51a0766cf747','2023-08-13','2024-02-29','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('7e8795e8-325f-4e65-970a-e58430316ea7','183bf829-76c2-44c7-8a20-b5c8b073efcb','09c9e27b-7ab0-405a-9c1c-bb5637b2082d','2023-07-18','2024-04-26','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','17c56aee-5b7c-4110-99d5-57b15efc48d6','2024-03-23','2024-02-03','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('1c797c78-d1ee-4156-9138-78901e588bf0','679d63bc-b896-480b-be7f-c48780872ba6','e2c608fc-982f-447b-badb-518a0f831555','2023-08-17','2023-12-13','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('2ae67883-12f5-441c-81bf-6b3ba94b71de','679d63bc-b896-480b-be7f-c48780872ba6','0b2ce573-ff78-4d1d-8201-dfd61b683cb9','2024-06-24','2023-12-09','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('7643d20f-356c-4f8b-a909-7b9c1815ca95','183bf829-76c2-44c7-8a20-b5c8b073efcb','cacd6f06-8c8a-43eb-972a-1b4be95c280c','2023-12-25','2024-03-24','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','95217546-304a-482a-812d-a0c7556170d8','2023-08-13','2024-06-30','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('4afd9e20-2e32-47de-a59b-a485fa333b0b','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','b06eec9e-7421-4792-b138-9390a51ffc20','2023-10-21','2023-08-10','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('993ff139-1fb7-4da7-98e0-62eff86a96e7','183bf829-76c2-44c7-8a20-b5c8b073efcb','2aba3a23-018d-4dd3-ac2b-cae2de0a6196','2024-06-03','2023-12-30','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('c849f32a-85f8-4455-bd20-ddf29cbd187a','dd588b33-76f9-4032-a754-6aa34e26de7b','658e7749-3030-4c33-b25c-de647205acd1','2023-09-23','2024-03-11','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('7280906d-97fa-479f-b257-c9f2d7bfb6ba','183bf829-76c2-44c7-8a20-b5c8b073efcb','4260587b-eb5b-4287-bfdb-479792fc05f3','2023-07-29','2023-09-13','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('89e7214a-055d-45d6-ad43-cc091da33ca2','183bf829-76c2-44c7-8a20-b5c8b073efcb','4c27d3c9-8748-48e9-a068-e94f35dbbc21','2024-04-04','2023-09-29','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('875a9117-fd70-4f90-902a-91c04a7e6727','183bf829-76c2-44c7-8a20-b5c8b073efcb','b0615ced-33c0-4095-a8e0-eb96ebda3b8e','2023-12-29','2023-12-14','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('50da1ec7-c569-41b9-abac-1559cb7ac89c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','884b1f7f-559a-4311-b735-77c9cba90210','2024-02-21','2024-04-01','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('bc2ea856-1419-4265-885a-77cb5f8965e0','dd588b33-76f9-4032-a754-6aa34e26de7b','297e15f9-10b6-4e16-a2d2-79f16236e3d6','2023-09-14','2023-10-19','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('1d5fdf23-e6a3-4e86-a740-22ad79eb67b9','679d63bc-b896-480b-be7f-c48780872ba6','f577910b-a17f-451d-a9cd-3a10914f6ed6','2024-06-27','2023-11-09','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('56f7f1af-c9ba-4fd3-b8b9-4068ac2fe5c3','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','c0fc70bf-90fa-4ad1-81b7-9d02ed88fd2a','2024-04-11','2023-11-30','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('cce41f90-6648-4ae2-bd07-baca6e46c154','dd588b33-76f9-4032-a754-6aa34e26de7b','5d29b97a-d300-4d77-a0c3-27f8587c8a6b','2023-12-31','2024-07-06','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('2ae67883-12f5-441c-81bf-6b3ba94b71de','679d63bc-b896-480b-be7f-c48780872ba6','9ea5bf65-9ae2-4dd0-a9eb-3d9eb8fb3d8c','2024-01-12','2024-02-10','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','2d75d314-0af8-44f2-baab-7e342b692bbb','2024-02-21','2023-08-11','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('4e4f2a4b-0697-4ef6-ad53-1094c1c181b6','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','f6f5c967-33a8-4d4b-ac90-7afe5c220390','2023-11-05','2024-05-20','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('6a388309-2818-4170-8909-3167eb82df1e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','80235fc8-f66e-4540-85c3-d591b9700a2d','2023-11-13','2023-12-21','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('546101da-27f9-4d36-849a-2ff3665800ea','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','41f1d727-6a4d-4ca0-9595-50a7b7543c28','2024-02-11','2023-12-03','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('10092407-3e42-4fff-862b-788635d26146','679d63bc-b896-480b-be7f-c48780872ba6','c1019fcd-5e69-4988-b7a6-e269c6602de0','2024-06-30','2023-11-07','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('993ff139-1fb7-4da7-98e0-62eff86a96e7','183bf829-76c2-44c7-8a20-b5c8b073efcb','bf55752b-9130-43ff-ab37-2d62bb55d824','2023-10-01','2024-06-22','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('7643d20f-356c-4f8b-a909-7b9c1815ca95','183bf829-76c2-44c7-8a20-b5c8b073efcb','8b3e4b74-8202-4d31-9740-f1213ae1ea59','2024-06-23','2023-10-09','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('2653569d-07f8-4729-81e9-ef6a53d11b76','679d63bc-b896-480b-be7f-c48780872ba6','8c50c229-620b-4bf9-ad25-fc327ba67a82','2024-04-03','2024-05-26','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','6701cabf-b990-413d-91a6-eaa17d6fe52c','2024-05-21','2024-04-08','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('79b97c21-87e5-49e5-80a6-0ff60e1a40d4','183bf829-76c2-44c7-8a20-b5c8b073efcb','786fa215-c1c0-42aa-97c5-a847defd8be9','2024-06-19','2023-11-03','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('95a709f1-954d-4531-853b-1a7c9567516e','183bf829-76c2-44c7-8a20-b5c8b073efcb','f063e68c-42ed-4d4c-925a-46f9c4c116c4','2023-10-09','2024-01-28','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('95a709f1-954d-4531-853b-1a7c9567516e','183bf829-76c2-44c7-8a20-b5c8b073efcb','a3d7cfe9-8323-48b0-b75b-761a0d4673d1','2023-11-01','2023-09-29','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('52b1a258-b7ab-49d3-a7e5-af564a3cd20a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','49e7824d-98b2-4194-8314-b54d070131e5','2024-02-10','2023-09-24','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('875a9117-fd70-4f90-902a-91c04a7e6727','183bf829-76c2-44c7-8a20-b5c8b073efcb','266d63a7-521d-47b2-92da-4d08e3e8740a','2023-09-29','2024-01-17','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('17d9c6e4-3ad0-4b3f-b032-b44291d8fdd1','679d63bc-b896-480b-be7f-c48780872ba6','e67da10a-c29d-4f72-9767-beb4cc35bc89','2024-06-18','2023-08-06','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('a1562999-410e-466e-9d01-11c2f0846077','183bf829-76c2-44c7-8a20-b5c8b073efcb','ad8b69d7-dfde-4374-b1b0-849e8da0b86d','2024-01-28','2024-06-25','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('70ae8751-489d-4c64-9197-a80e93498e6e','183bf829-76c2-44c7-8a20-b5c8b073efcb','d6361162-4a58-4599-8912-110c7e774d32','2023-12-22','2024-04-08','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('c991a456-859a-4f5f-8864-97a682c519a3','dd588b33-76f9-4032-a754-6aa34e26de7b','c352e672-e592-460c-98ea-94ca8e30001f','2024-05-24','2024-07-02','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('5a8223b4-ca9f-4698-ac36-bdc6d3f0bc66','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','6eb37094-c8e4-447e-a4ab-6c7e46a2aecc','2023-08-08','2023-12-25','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('0cebe138-0e46-4312-9cc4-ec5dc8666a42','679d63bc-b896-480b-be7f-c48780872ba6','8324bcf1-5ed2-453d-bacf-e511398a2d45','2024-04-24','2024-02-28','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('56f7f1af-c9ba-4fd3-b8b9-4068ac2fe5c3','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','a57bf715-2375-4059-8e54-f6c1298d9988','2023-07-24','2024-01-18','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('101637f3-b6b5-4b5d-9d60-8c05ed03c9d9','679d63bc-b896-480b-be7f-c48780872ba6','c41a2994-bc05-45ea-b93d-efde71203a38','2023-09-03','2024-03-23','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','7aa97a7c-611c-4a99-a2d9-16c9e85ccf7a','2023-11-09','2024-06-10','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('968aaa29-7b8e-4adb-bcfe-0c3f0154c68f','183bf829-76c2-44c7-8a20-b5c8b073efcb','51aae3bb-c379-4b7a-951d-5cd53dd8c40a','2023-09-05','2024-04-14','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('993ff139-1fb7-4da7-98e0-62eff86a96e7','183bf829-76c2-44c7-8a20-b5c8b073efcb','4a6a65d5-6314-4cf8-9269-70b5c1de4a27','2024-02-24','2023-09-20','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('348a9a95-f1a3-412d-9824-894cd77f1e3a','679d63bc-b896-480b-be7f-c48780872ba6','8c34dd80-c419-4e37-883c-8864c3d0d9de','2023-08-22','2023-09-18','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('c991a456-859a-4f5f-8864-97a682c519a3','dd588b33-76f9-4032-a754-6aa34e26de7b','9292b82c-7d7a-48c8-b46d-97fc6780de97','2024-02-03','2023-08-14','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','f7ef29e9-b44a-4678-a74a-b11fc267a136','2024-04-17','2023-09-18','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('c83a56d6-c676-43dc-a858-d3aa801bbf61','dd588b33-76f9-4032-a754-6aa34e26de7b','8a945dc6-705c-4cf7-a638-20f7e84d87dc','2023-12-07','2023-08-16','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('7280906d-97fa-479f-b257-c9f2d7bfb6ba','183bf829-76c2-44c7-8a20-b5c8b073efcb','6e7855a0-532d-4f43-96c0-c8961dfb6c80','2024-06-30','2024-03-07','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('a55211af-ebef-4ac7-bac9-be25c2ea3820','dd588b33-76f9-4032-a754-6aa34e26de7b','9d55afc6-971d-4f09-b3c9-1fa296a7d226','2023-08-31','2024-01-13','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('6534cb41-6517-4ef9-a84c-5685ee6f719d','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','fb248b1e-f044-4681-accd-30eb2e12c3b2','2024-04-09','2024-01-31','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('6a388309-2818-4170-8909-3167eb82df1e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','e1c59953-f9f1-426e-a674-02d7ce927257','2024-03-11','2023-12-26','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('17d9c6e4-3ad0-4b3f-b032-b44291d8fdd1','679d63bc-b896-480b-be7f-c48780872ba6','d58b0dc2-ba31-431a-8b4b-a45b143e0aaa','2023-11-01','2024-06-03','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('d66b2d2c-023c-48df-b3e3-4f79841d10aa','dd588b33-76f9-4032-a754-6aa34e26de7b','577a2440-f0e2-4fa7-96b0-d9b9f5978d63','2024-04-01','2023-11-04','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('b9c36c7f-dd96-44f8-88f8-ffdf6be81344','dd588b33-76f9-4032-a754-6aa34e26de7b','55e95b7f-5667-423a-ae07-3fecf18bec9a','2023-11-05','2023-12-17','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('a309ddfd-b618-4adb-8f29-2fd427e3ad09','dd588b33-76f9-4032-a754-6aa34e26de7b','7f20ca27-6a6e-43bd-93cb-8d7dab1fac97','2024-01-23','2023-09-14','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('2653569d-07f8-4729-81e9-ef6a53d11b76','679d63bc-b896-480b-be7f-c48780872ba6','9c596da1-4b6b-4ca3-8529-ae14ca6cc556','2023-07-12','2023-12-16','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('7643d20f-356c-4f8b-a909-7b9c1815ca95','183bf829-76c2-44c7-8a20-b5c8b073efcb','1214e5cd-2be4-47eb-96a5-f83aa9b6c891','2023-09-26','2023-08-14','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('0cebe138-0e46-4312-9cc4-ec5dc8666a42','679d63bc-b896-480b-be7f-c48780872ba6','ff260aa0-a7dd-49a6-a58d-21a86b91c5d9','2024-01-04','2023-08-06','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('c2152a68-b0a0-45ac-88a8-ceea7947948e','dd588b33-76f9-4032-a754-6aa34e26de7b','efe9e29a-04fe-4da8-9e2c-fbe13648d55a','2024-01-26','2023-09-05','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('a55211af-ebef-4ac7-bac9-be25c2ea3820','dd588b33-76f9-4032-a754-6aa34e26de7b','3d7ee1fd-5b8f-49cb-8f64-6cfaeefd0714','2024-03-07','2024-03-12','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('2ae67883-12f5-441c-81bf-6b3ba94b71de','679d63bc-b896-480b-be7f-c48780872ba6','5a31a953-d09a-46d0-830f-427858025cbe','2023-07-30','2023-09-12','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('d7455936-559f-403b-8a1e-418be08ec623','dd588b33-76f9-4032-a754-6aa34e26de7b','f21f71cf-badd-4029-a5ca-12e95b84cbeb','2023-08-28','2023-09-08','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('b06251b8-a11b-4e92-8c79-2f57cacd59ec','dd588b33-76f9-4032-a754-6aa34e26de7b','86080c66-6b6a-44f2-8791-5d395649f104','2024-04-21','2024-06-10','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('8d26c0ec-2fcd-4080-a114-3b568ff4224b','183bf829-76c2-44c7-8a20-b5c8b073efcb','4951093a-043d-40e7-b969-fdbe84b29ec2','2024-06-02','2023-07-27','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','fccdce61-8f4a-438c-bf16-0db9cef86717','2024-03-22','2023-12-08','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','359e6418-6663-48b9-970b-9441cf4c4a28','2023-07-27','2023-10-14','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('348a9a95-f1a3-412d-9824-894cd77f1e3a','679d63bc-b896-480b-be7f-c48780872ba6','c667f8f2-9e2a-4e4b-b17b-4e14b195546e','2024-03-25','2023-11-04','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('42f792d5-a5e2-40f5-b902-898c8da3b040','679d63bc-b896-480b-be7f-c48780872ba6','422bca7a-078e-4975-bc9f-c2d6cf3e7502','2023-08-03','2023-12-05','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','fbd4039a-a1fc-4965-96e0-64588b852fa8','2023-08-04','2023-07-17','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('50da1ec7-c569-41b9-abac-1559cb7ac89c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','8492b799-3300-4829-adeb-74f8dc0aa75c','2023-12-04','2023-07-22','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('10092407-3e42-4fff-862b-788635d26146','679d63bc-b896-480b-be7f-c48780872ba6','41473167-1f23-47cf-9f08-83d5d6288ee3','2024-05-04','2024-05-24','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('5a8223b4-ca9f-4698-ac36-bdc6d3f0bc66','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','16c8ab21-d42a-49d1-b7df-749b3bbdc5cd','2024-03-05','2023-09-25','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('b9c36c7f-dd96-44f8-88f8-ffdf6be81344','dd588b33-76f9-4032-a754-6aa34e26de7b','1d988cca-a8ee-4c71-8dc4-66144879ba95','2023-09-30','2023-11-14','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('1d5fdf23-e6a3-4e86-a740-22ad79eb67b9','679d63bc-b896-480b-be7f-c48780872ba6','20109018-a569-4f9d-b480-0b70e24b52f0','2024-01-15','2024-05-10','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('cce41f90-6648-4ae2-bd07-baca6e46c154','dd588b33-76f9-4032-a754-6aa34e26de7b','eff27410-6b86-41f6-8f0d-bf1fb69ca80c','2023-10-25','2023-11-10','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('0952aadb-1834-414c-bb94-756544803883','679d63bc-b896-480b-be7f-c48780872ba6','b9376697-0322-4454-8a3c-5aedab5cb305','2024-07-01','2023-12-10','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('50da1ec7-c569-41b9-abac-1559cb7ac89c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','ed5b0dc9-d6c5-4f9a-b7c7-b7a0813ffdf9','2023-12-26','2023-08-05','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('95a709f1-954d-4531-853b-1a7c9567516e','183bf829-76c2-44c7-8a20-b5c8b073efcb','ee8312cb-3f1e-4fd6-a092-b43d68182515','2024-04-22','2024-06-12','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('7e8795e8-325f-4e65-970a-e58430316ea7','183bf829-76c2-44c7-8a20-b5c8b073efcb','10c047d8-9ee0-4f10-bd12-152a4065b64f','2024-04-07','2024-01-29','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('50da1ec7-c569-41b9-abac-1559cb7ac89c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','94985ef7-888b-464a-b215-4a3be9e905a2','2024-06-19','2023-11-10','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('1d5fdf23-e6a3-4e86-a740-22ad79eb67b9','679d63bc-b896-480b-be7f-c48780872ba6','647f4154-9496-473e-a45d-b7a901b8bc10','2024-06-30','2024-02-17','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('77b23c41-48c9-4493-bbf2-40db442cb444','183bf829-76c2-44c7-8a20-b5c8b073efcb','fb042fd9-2926-4feb-8ad8-728b49fd59f7','2024-05-28','2024-07-01','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('52b1a258-b7ab-49d3-a7e5-af564a3cd20a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','0a4d4ed1-884e-4eeb-ac43-a99a928060db','2024-02-16','2024-01-28','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('0d0bbdea-bc4e-41e6-86a3-38fc13f9933d','679d63bc-b896-480b-be7f-c48780872ba6','61db005c-f3a1-4671-a6ba-a6a4217b8fdb','2023-10-06','2023-11-28','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('70ae8751-489d-4c64-9197-a80e93498e6e','183bf829-76c2-44c7-8a20-b5c8b073efcb','77e88a20-2f1f-43c9-9e0f-848c65a6827e','2024-06-11','2023-08-13','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('5ab65223-ff3e-4d46-b3b4-2ecb9e68add9','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','94f77af9-31da-4f78-8067-1a6c2708c277','2023-11-08','2023-10-22','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('0952aadb-1834-414c-bb94-756544803883','679d63bc-b896-480b-be7f-c48780872ba6','d15528b1-831b-4f46-9af9-f0ec2c69e355','2023-09-04','2023-10-31','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('bd2edd61-412a-433a-9d5a-e3096ee943db','dd588b33-76f9-4032-a754-6aa34e26de7b','d1343685-d43f-40fd-844a-31885bbd970b','2024-02-04','2024-04-28','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','9aa4cf7f-1a5d-44b7-9455-20035a13d158','2024-03-02','2024-03-06','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('a55211af-ebef-4ac7-bac9-be25c2ea3820','dd588b33-76f9-4032-a754-6aa34e26de7b','d4e74256-c151-4e95-b4eb-fb809e3ca536','2023-12-08','2023-09-22','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('9ef92827-bbf9-4924-b91d-40b5e0ccd5f6','183bf829-76c2-44c7-8a20-b5c8b073efcb','0cd73d08-a8e8-465e-be89-caf606ddeb67','2024-06-08','2024-05-11','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('d7455936-559f-403b-8a1e-418be08ec623','dd588b33-76f9-4032-a754-6aa34e26de7b','5825e778-dce4-4aee-b91c-def0a7d39c35','2024-04-26','2024-04-30','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('1d5fdf23-e6a3-4e86-a740-22ad79eb67b9','679d63bc-b896-480b-be7f-c48780872ba6','5f1ff6d3-d07c-49a7-9138-f5c744a472f5','2024-07-03','2024-04-30','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('17d9c6e4-3ad0-4b3f-b032-b44291d8fdd1','679d63bc-b896-480b-be7f-c48780872ba6','60dc4e2a-6a6b-4add-a9ed-86c6b36fa5ef','2023-07-13','2024-06-17','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('3c67c06e-5feb-43c7-97bc-29754e602ec8','679d63bc-b896-480b-be7f-c48780872ba6','ea35cf2d-e9f1-45aa-96ac-e24a1d390c57','2023-09-09','2023-12-09','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('9ef92827-bbf9-4924-b91d-40b5e0ccd5f6','183bf829-76c2-44c7-8a20-b5c8b073efcb','0392e8a1-784c-43b5-9e48-81dcf841171e','2023-10-05','2024-06-11','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('8d26c0ec-2fcd-4080-a114-3b568ff4224b','183bf829-76c2-44c7-8a20-b5c8b073efcb','d1944ddb-ea6a-4c29-a2fa-27183ee6e810','2023-11-26','2024-04-08','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('95a709f1-954d-4531-853b-1a7c9567516e','183bf829-76c2-44c7-8a20-b5c8b073efcb','1e208c79-ac78-4966-9e43-ac1f1d368841','2023-07-26','2024-06-24','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('47c8a66c-1f67-49c4-b275-86d357254c35','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','90bc2dd0-75f8-4b1b-b331-fa2aeef05c7e','2023-09-04','2024-05-27','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('2653569d-07f8-4729-81e9-ef6a53d11b76','679d63bc-b896-480b-be7f-c48780872ba6','92542c75-f763-42e6-9494-0634efe9034b','2023-11-04','2024-01-08','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','a327deab-6541-4e16-bb8c-ec5cd5c28833','2024-02-18','2023-10-09','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('7e8795e8-325f-4e65-970a-e58430316ea7','183bf829-76c2-44c7-8a20-b5c8b073efcb','0b828146-102f-4b43-a68a-b14e3d5c8824','2024-05-30','2023-09-05','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('77b23c41-48c9-4493-bbf2-40db442cb444','183bf829-76c2-44c7-8a20-b5c8b073efcb','173a56a8-fe0a-4918-ada7-bba188034b9a','2024-03-07','2023-11-20','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('a309ddfd-b618-4adb-8f29-2fd427e3ad09','dd588b33-76f9-4032-a754-6aa34e26de7b','78370e2c-c4fb-4866-8f16-625b075b4e3e','2023-12-29','2024-04-11','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('95a709f1-954d-4531-853b-1a7c9567516e','183bf829-76c2-44c7-8a20-b5c8b073efcb','4c83b716-fbc9-4700-ac97-227d831358a3','2024-02-05','2023-12-17','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','14f5e32d-75d4-4e7b-ad2f-8cdd055ed2cd','2024-03-16','2023-12-04','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('b9c36c7f-dd96-44f8-88f8-ffdf6be81344','dd588b33-76f9-4032-a754-6aa34e26de7b','13629957-3bf9-4482-940d-20b0adfecb61','2023-11-14','2024-01-07','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('24cd9888-b743-49d6-99e0-9dd290f93b7b','679d63bc-b896-480b-be7f-c48780872ba6','e741b484-7bde-415f-b113-97c48b7cf349','2024-01-23','2023-10-24','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('101637f3-b6b5-4b5d-9d60-8c05ed03c9d9','679d63bc-b896-480b-be7f-c48780872ba6','146dee63-cf90-4a8d-b054-203a50bb9e71','2023-08-04','2024-05-21','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('b9c36c7f-dd96-44f8-88f8-ffdf6be81344','dd588b33-76f9-4032-a754-6aa34e26de7b','9b32b9d3-6a92-4e12-9b8e-b02445435d6c','2024-02-12','2023-11-10','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('bd2edd61-412a-433a-9d5a-e3096ee943db','dd588b33-76f9-4032-a754-6aa34e26de7b','de1cde62-3c87-4166-b821-5e2dd24862ab','2023-08-03','2024-01-25','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','712021df-8218-430b-8caf-a4a9dee60ad6','2023-11-05','2023-10-10','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','095d9f3c-8c70-4717-8cdc-d02e055a6577','2023-11-04','2023-07-14','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('b9c36c7f-dd96-44f8-88f8-ffdf6be81344','dd588b33-76f9-4032-a754-6aa34e26de7b','09f4f3be-97c1-4e4c-a815-ee577ec9a881','2023-08-14','2023-12-23','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('2b5b6b54-0639-42fc-a16d-9dc374639005','679d63bc-b896-480b-be7f-c48780872ba6','6e5411ab-d3b4-4939-bbe1-2f15ae8a17da','2024-06-08','2023-08-28','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a2db8651-cf91-4310-a717-1ebb8074950f','183bf829-76c2-44c7-8a20-b5c8b073efcb','df0548d7-e0b5-4e41-ba30-2d1043a7a5cf','2024-06-27','2024-03-31','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('17d9c6e4-3ad0-4b3f-b032-b44291d8fdd1','679d63bc-b896-480b-be7f-c48780872ba6','c211304f-62f4-4957-a755-62b82da5b18b','2024-06-23','2024-05-30','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a2db8651-cf91-4310-a717-1ebb8074950f','183bf829-76c2-44c7-8a20-b5c8b073efcb','9320b091-3d2f-474e-be1a-09ae7e338d4b','2024-06-12','2024-04-13','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('010c83a8-5059-45ca-ace6-cdc9b150d2b6','679d63bc-b896-480b-be7f-c48780872ba6','8d3d35df-917b-444d-9925-d1a3a21d4b16','2023-08-10','2023-08-02','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('89e7214a-055d-45d6-ad43-cc091da33ca2','183bf829-76c2-44c7-8a20-b5c8b073efcb','3fe543ab-b023-4b2e-85a3-607d641ae5f7','2023-08-19','2023-11-29','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('50da1ec7-c569-41b9-abac-1559cb7ac89c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','feac9c79-3c45-4257-84fe-33f5100ab9ea','2023-07-21','2024-04-07','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('10092407-3e42-4fff-862b-788635d26146','679d63bc-b896-480b-be7f-c48780872ba6','35118e61-3094-45d0-9057-e3e0f9612ae2','2023-12-27','2023-11-24','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('c83a56d6-c676-43dc-a858-d3aa801bbf61','dd588b33-76f9-4032-a754-6aa34e26de7b','39c839ad-2d1b-49b6-b7c9-7e3c52dccc42','2024-01-30','2023-08-04','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('152fdef4-cde2-4763-8ae2-138b6dc4dbcb','679d63bc-b896-480b-be7f-c48780872ba6','bbed9957-4285-425d-99df-be21f1ae31e4','2024-06-03','2023-07-30','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('5b8856d8-f1b2-4cd9-baf5-46c37a6130ed','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','47082564-815d-4948-916d-c622fc06f773','2024-02-22','2023-10-17','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('993ff139-1fb7-4da7-98e0-62eff86a96e7','183bf829-76c2-44c7-8a20-b5c8b073efcb','afea53c6-a489-42df-8d26-f974ee809239','2024-03-03','2024-01-11','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('348a9a95-f1a3-412d-9824-894cd77f1e3a','679d63bc-b896-480b-be7f-c48780872ba6','8a469743-0a1d-4ab6-9be4-b558c9c0431b','2024-06-15','2023-10-07','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('152fdef4-cde2-4763-8ae2-138b6dc4dbcb','679d63bc-b896-480b-be7f-c48780872ba6','7315e4f7-f0ef-4edd-a1e2-aab860f66b21','2024-02-23','2024-01-15','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('101637f3-b6b5-4b5d-9d60-8c05ed03c9d9','679d63bc-b896-480b-be7f-c48780872ba6','680f6b5e-d29d-40b9-8cee-622ba01f15dd','2024-01-12','2023-10-18','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('77b23c41-48c9-4493-bbf2-40db442cb444','183bf829-76c2-44c7-8a20-b5c8b073efcb','210dc92e-3a31-462e-b317-d18ddd631d9f','2023-09-30','2024-03-08','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('152fdef4-cde2-4763-8ae2-138b6dc4dbcb','679d63bc-b896-480b-be7f-c48780872ba6','6898ffc2-b515-4c35-b4f7-40e320a5507f','2024-03-10','2023-08-01','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_credit_pack_purchases (user_id,branch_id,credit_pack_id,credit_pack_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('c991a456-859a-4f5f-8864-97a682c519a3','dd588b33-76f9-4032-a754-6aa34e26de7b','29b291cf-19cf-489c-a205-cef07590ba2b','2023-10-07','2023-12-29','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('77b23c41-48c9-4493-bbf2-40db442cb444','183bf829-76c2-44c7-8a20-b5c8b073efcb','439e7e76-7a95-45ab-8727-4337b45e10cd','2024-01-09','2023-12-24','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','b82e83ee-3fdf-4625-aa95-62f490daa19c','2024-01-19','2024-06-02','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('bd2edd61-412a-433a-9d5a-e3096ee943db','dd588b33-76f9-4032-a754-6aa34e26de7b','902e2b27-07dd-4e73-ba55-8792eabd0ffb','2023-10-24','2024-04-05','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('5b8856d8-f1b2-4cd9-baf5-46c37a6130ed','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','010ed4cb-ec4c-4a2b-8eda-3b904a8017e6','2024-05-03','2024-04-02','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('2653569d-07f8-4729-81e9-ef6a53d11b76','679d63bc-b896-480b-be7f-c48780872ba6','5ab4a3f4-ada0-4806-ba38-5cb5a29ac78a','2023-10-21','2024-07-03','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','9f2bb234-0c1c-4fec-870b-ec7eca1b8330','2024-01-02','2023-09-25','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('16ee9581-ca73-471b-902c-62b265dd654f','679d63bc-b896-480b-be7f-c48780872ba6','ed5d6262-eaa4-410d-9610-539a9036d652','2023-09-09','2024-04-13','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('5dc072a6-d336-46a9-803f-3ecc4e5fdcaf','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','f855b0af-9571-4a74-9f88-45ab0216bace','2023-08-08','2024-05-17','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('c2152a68-b0a0-45ac-88a8-ceea7947948e','dd588b33-76f9-4032-a754-6aa34e26de7b','45611797-82bf-446a-b1fd-99915b92e9c5','2023-12-23','2024-03-02','{"name": "Monthly Membership", "source": "WEBPORTAL"}');

 
 
 
 INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('a1562999-410e-466e-9d01-11c2f0846077','183bf829-76c2-44c7-8a20-b5c8b073efcb','a3fc3917-3fef-4054-8afe-2747a5bb54ee','2023-01-18','2023-09-08','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('dd36cf94-b0ec-490a-acd8-1a99a6686601','2b94d71e-6311-4069-944f-d90c3206dc40','9f369a8e-838e-454e-87ee-8bb64e2e7f02','2024-06-11','2024-07-10','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','5c93977f-cbef-4274-8c42-8a618eae5086','2024-01-11','2023-10-23','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('f4684124-04b3-4762-a272-8530f3d7c8a1','2b94d71e-6311-4069-944f-d90c3206dc40','a63bcfb9-2e5c-4a35-bd27-3839628a2fcc','2023-09-22','2023-04-12','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('968aaa29-7b8e-4adb-bcfe-0c3f0154c68f','183bf829-76c2-44c7-8a20-b5c8b073efcb','a2244480-bff1-46d1-9f5c-a025bc645a81','2023-03-10','2023-01-19','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','0ee6cfe4-d156-4fb6-8f7e-535ef559295b','2024-03-30','2023-01-15','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('89e7214a-055d-45d6-ad43-cc091da33ca2','183bf829-76c2-44c7-8a20-b5c8b073efcb','7519b10d-9801-4aac-8384-8af9d862c532','2023-05-26','2024-06-24','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('5ab65223-ff3e-4d46-b3b4-2ecb9e68add9','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','d46e01b7-a073-4281-9907-aefa9755d588','2023-04-05','2023-06-25','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('6534cb41-6517-4ef9-a84c-5685ee6f719d','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','a713c0c1-6968-4242-8fed-e6c21d36253b','2024-01-26','2023-10-26','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('dfc13311-c09a-4485-872e-7b4411fb23a1','2b94d71e-6311-4069-944f-d90c3206dc40','8b9328a9-9ed2-4069-9379-110493b98ca2','2024-04-17','2024-02-07','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('fa99041b-810d-4486-9689-ef904e7e56a3','2b94d71e-6311-4069-944f-d90c3206dc40','19b99ed6-1a57-464e-bf12-0468492e7326','2023-03-01','2024-03-07','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','700949dd-9d01-4070-ba6b-817e2b42165f','2023-06-20','2023-11-26','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('a309ddfd-b618-4adb-8f29-2fd427e3ad09','dd588b33-76f9-4032-a754-6aa34e26de7b','985e63ec-9221-4042-82ca-07a9dcf6d762','2023-09-09','2023-11-25','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('e56e4383-5fed-4155-9a42-5d722b60e90d','2b94d71e-6311-4069-944f-d90c3206dc40','a834b7bc-fa33-4661-9d07-6c553dab800d','2023-03-18','2023-01-10','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('7643d20f-356c-4f8b-a909-7b9c1815ca95','183bf829-76c2-44c7-8a20-b5c8b073efcb','1ff0d0c6-c7e1-4766-b338-a066dff42e91','2023-07-04','2024-02-02','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('cce41f90-6648-4ae2-bd07-baca6e46c154','dd588b33-76f9-4032-a754-6aa34e26de7b','1d4f739f-8ed3-4407-a56e-ea7de960be6d','2023-05-01','2024-05-11','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('fa99041b-810d-4486-9689-ef904e7e56a3','2b94d71e-6311-4069-944f-d90c3206dc40','4b2ceb59-5e18-4183-8944-6c5a085bd0e3','2023-08-08','2024-02-21','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('6c06a496-88a8-40c0-a3f5-fa590c73b2fa','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','58d75e4f-a724-4010-a212-88fb3a1e2f68','2023-08-01','2023-05-15','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('5dc072a6-d336-46a9-803f-3ecc4e5fdcaf','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','63d74fd4-b986-4428-a20e-ef3c2cc667b2','2023-10-22','2023-05-04','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('fd1c3dfc-c0e6-4cc2-bab7-c67e026bb939','2b94d71e-6311-4069-944f-d90c3206dc40','76435e54-4023-433c-9571-db82a4e0ed09','2023-12-11','2023-08-29','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('fd1c3dfc-c0e6-4cc2-bab7-c67e026bb939','2b94d71e-6311-4069-944f-d90c3206dc40','61784a0e-40fe-4c84-a347-6f9ea570a37a','2023-05-01','2024-07-04','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('6534cb41-6517-4ef9-a84c-5685ee6f719d','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','465cfcfc-fcd5-4948-bb15-e7a826acf58f','2023-08-09','2024-04-05','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('da1909ce-a694-43d8-9a4d-b9e2e825269c','2b94d71e-6311-4069-944f-d90c3206dc40','55c1e51a-69e2-43ca-b8a5-b5fbbc82e844','2023-02-02','2023-04-01','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('a3a9ee53-9c57-42e3-8d4f-147e4881dce7','dd588b33-76f9-4032-a754-6aa34e26de7b','42e5214c-7366-4b57-9421-8d1cac837e25','2024-01-14','2023-09-20','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('4afd9e20-2e32-47de-a59b-a485fa333b0b','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','5e0263b7-a4a8-4d53-942a-b7889f58c3e7','2023-11-05','2023-08-03','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','5f0f617c-4c3b-46a2-b35e-316ec592b1f7','2024-03-26','2024-07-05','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('eb8539e3-7f81-4399-9872-6c8406858054','2b94d71e-6311-4069-944f-d90c3206dc40','7f9a70de-5190-4c2c-89aa-56f59459a6dd','2024-06-05','2023-05-04','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('eb8539e3-7f81-4399-9872-6c8406858054','2b94d71e-6311-4069-944f-d90c3206dc40','39991eb8-eb03-40cd-ba27-34b666cb0503','2023-12-07','2023-12-24','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('d895a409-9f03-43c0-946d-a9b1717afdc0','2b94d71e-6311-4069-944f-d90c3206dc40','0510a69d-162f-497c-b7f5-eadd1890df66','2023-12-25','2023-02-25','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('82cd1bb4-f8cf-49fd-8cac-104fc0cbb024','183bf829-76c2-44c7-8a20-b5c8b073efcb','6fc5aba5-c2df-49ca-8e6f-2967fc12a0b8','2024-01-28','2024-02-06','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('5b8856d8-f1b2-4cd9-baf5-46c37a6130ed','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','da1a2335-c986-45a4-bccc-c174195acfa6','2023-11-26','2023-01-08','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('d66b2d2c-023c-48df-b3e3-4f79841d10aa','dd588b33-76f9-4032-a754-6aa34e26de7b','ab864b0f-e595-4a5a-b847-a103dca080e0','2024-01-10','2023-01-25','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('9ef92827-bbf9-4924-b91d-40b5e0ccd5f6','183bf829-76c2-44c7-8a20-b5c8b073efcb','53399d60-741a-42eb-814f-8c18b905b6d4','2023-11-01','2023-06-08','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('52b1a258-b7ab-49d3-a7e5-af564a3cd20a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','afabdc53-6963-4117-bb68-610047c7fa74','2023-07-20','2024-04-14','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a309ddfd-b618-4adb-8f29-2fd427e3ad09','dd588b33-76f9-4032-a754-6aa34e26de7b','47d76cac-e17b-4e20-a978-908ee85074a7','2024-04-24','2024-02-22','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','a17a11b1-112e-4988-b1ac-12d512807163','2024-03-27','2023-04-26','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('adcd90cd-e764-4fe8-8c26-9e0aa21cb017','dd588b33-76f9-4032-a754-6aa34e26de7b','0a12362e-ecc7-4bd6-8d74-63dd42c96fbd','2023-09-11','2024-05-08','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('51372890-bb9c-4f47-ab23-83d1411aead1','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','420232b8-6644-4f4a-9505-9bcdadb63342','2023-11-28','2023-04-04','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('9ef92827-bbf9-4924-b91d-40b5e0ccd5f6','183bf829-76c2-44c7-8a20-b5c8b073efcb','1e3ba649-fd1c-4ebe-96f4-f69727ce2555','2023-08-06','2023-09-13','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('24cd9888-b743-49d6-99e0-9dd290f93b7b','679d63bc-b896-480b-be7f-c48780872ba6','4ec66972-da8d-4d64-bce1-5ea5f5fd8d34','2023-07-08','2023-05-17','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('adcd90cd-e764-4fe8-8c26-9e0aa21cb017','dd588b33-76f9-4032-a754-6aa34e26de7b','b6f95427-045a-4649-ad00-e5f4ad8caa23','2024-02-10','2024-05-25','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('82cd1bb4-f8cf-49fd-8cac-104fc0cbb024','183bf829-76c2-44c7-8a20-b5c8b073efcb','1f73eaca-1706-4afe-a9bd-3765bf8103f8','2024-01-07','2024-01-31','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('95a709f1-954d-4531-853b-1a7c9567516e','183bf829-76c2-44c7-8a20-b5c8b073efcb','e8215483-339b-4dc8-909a-7f31e05b26d4','2023-01-03','2024-05-09','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('79b97c21-87e5-49e5-80a6-0ff60e1a40d4','183bf829-76c2-44c7-8a20-b5c8b073efcb','086e47a9-089a-4e1a-9763-e7b10929a9f7','2023-04-17','2024-06-26','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a3a9ee53-9c57-42e3-8d4f-147e4881dce7','dd588b33-76f9-4032-a754-6aa34e26de7b','6c410080-252f-449f-a954-34e3e210df95','2023-08-07','2023-05-06','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('24cd9888-b743-49d6-99e0-9dd290f93b7b','679d63bc-b896-480b-be7f-c48780872ba6','5907b67f-681e-4ba4-86c7-f105c622804d','2024-03-28','2023-10-07','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('d895a409-9f03-43c0-946d-a9b1717afdc0','2b94d71e-6311-4069-944f-d90c3206dc40','cff35823-0647-4ea4-8a9e-fa5609ec40ab','2024-05-28','2023-09-01','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('77b23c41-48c9-4493-bbf2-40db442cb444','183bf829-76c2-44c7-8a20-b5c8b073efcb','b615b38a-4314-463e-816f-bbc91d72b5f3','2023-01-01','2023-05-23','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('3c67c06e-5feb-43c7-97bc-29754e602ec8','679d63bc-b896-480b-be7f-c48780872ba6','37691161-305d-476e-82e3-c9248078f97f','2023-04-12','2023-09-16','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('9ef92827-bbf9-4924-b91d-40b5e0ccd5f6','183bf829-76c2-44c7-8a20-b5c8b073efcb','01e6c458-db78-4b90-a881-b22a2839d41f','2023-04-17','2024-02-05','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','321c7746-ce4a-433e-8702-a0fc9aa1b6d8','2024-05-01','2023-07-20','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('6534cb41-6517-4ef9-a84c-5685ee6f719d','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','ecd5ff98-aef5-4c41-96c5-5891e25a13f9','2023-10-06','2023-06-14','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('e2ec7e1b-4980-4e60-8805-03293530cc37','2b94d71e-6311-4069-944f-d90c3206dc40','fa6a2a49-e979-4c52-96c9-7ee108f1613c','2023-05-18','2024-04-26','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('bd2edd61-412a-433a-9d5a-e3096ee943db','dd588b33-76f9-4032-a754-6aa34e26de7b','a57f5449-8667-46af-90f4-39cc80107d2a','2023-07-17','2024-01-21','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('2b5b6b54-0639-42fc-a16d-9dc374639005','679d63bc-b896-480b-be7f-c48780872ba6','566eec54-4322-4c1a-b7ed-9077074bdf11','2023-11-28','2024-02-17','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('da1909ce-a694-43d8-9a4d-b9e2e825269c','2b94d71e-6311-4069-944f-d90c3206dc40','5afc0993-b1d4-4b0d-9d4b-ce9377ac759a','2024-03-11','2023-02-18','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('5213812f-8929-4f7d-9e1f-ce618613460c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','4bc84366-ff2e-45a6-bf51-65c1f649ed81','2023-01-25','2023-12-31','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('51372890-bb9c-4f47-ab23-83d1411aead1','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','f9c71fde-08a1-4f46-9d06-cffa56793173','2023-05-20','2023-04-02','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('f8b3eac7-fd48-4d8d-abf9-87eb94f7ed98','2b94d71e-6311-4069-944f-d90c3206dc40','327bdc59-ae17-4c5e-b800-6b1c6a323813','2024-02-01','2023-09-30','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('52b1a258-b7ab-49d3-a7e5-af564a3cd20a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','c228295e-fee6-4a7c-afa2-98581b6a344b','2023-01-10','2024-05-29','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('f4684124-04b3-4762-a272-8530f3d7c8a1','2b94d71e-6311-4069-944f-d90c3206dc40','417fa7e0-5564-45f4-acee-843a2f1b0dbb','2023-12-30','2024-03-24','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('7643d20f-356c-4f8b-a909-7b9c1815ca95','183bf829-76c2-44c7-8a20-b5c8b073efcb','96edcf12-0b52-425e-ba47-63d49f923cfa','2023-08-10','2024-04-06','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('f8b3eac7-fd48-4d8d-abf9-87eb94f7ed98','2b94d71e-6311-4069-944f-d90c3206dc40','78696194-4399-415a-8f41-c5721d0104f3','2023-09-11','2024-04-03','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('3c67c06e-5feb-43c7-97bc-29754e602ec8','679d63bc-b896-480b-be7f-c48780872ba6','14ad80a9-7318-42f2-8298-6733d8df565e','2023-02-09','2023-06-28','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('f12147b1-8d2b-471a-b2a3-81d1c5f31c11','2b94d71e-6311-4069-944f-d90c3206dc40','48291622-4d45-469f-9341-9c8ccee6b428','2023-03-20','2023-03-24','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a55211af-ebef-4ac7-bac9-be25c2ea3820','dd588b33-76f9-4032-a754-6aa34e26de7b','939d11c7-6198-45dd-9823-0c0556734ca6','2023-10-07','2024-01-16','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('f8a48090-57fc-4dc0-a435-54fb78a304eb','2b94d71e-6311-4069-944f-d90c3206dc40','a8cad8f9-88a5-4122-9651-539af0fc6b1a','2023-01-25','2023-09-14','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','e22ec300-e3d1-40a5-8ee6-0446721cb89b','2023-06-08','2023-04-03','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('9e0fdce5-e985-4fca-991f-6cc8eccc65f5','183bf829-76c2-44c7-8a20-b5c8b073efcb','a9e57044-9c19-4d75-9786-c47b664f4a27','2023-11-23','2023-07-31','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('56f7f1af-c9ba-4fd3-b8b9-4068ac2fe5c3','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','32ffaa56-5255-4c31-ae19-57b52cbcb912','2023-06-19','2024-05-16','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('8d26c0ec-2fcd-4080-a114-3b568ff4224b','183bf829-76c2-44c7-8a20-b5c8b073efcb','b9c7c2d1-a47a-4c74-ac89-7890ca3b6952','2024-02-28','2024-05-14','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('7643d20f-356c-4f8b-a909-7b9c1815ca95','183bf829-76c2-44c7-8a20-b5c8b073efcb','1849df36-a80b-4065-8a9e-3cad3e6be2db','2023-12-02','2024-04-07','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('f8b3eac7-fd48-4d8d-abf9-87eb94f7ed98','2b94d71e-6311-4069-944f-d90c3206dc40','84f2b321-e7dc-42bf-8c07-e1e0aea3c869','2024-01-16','2023-03-24','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('fa99041b-810d-4486-9689-ef904e7e56a3','2b94d71e-6311-4069-944f-d90c3206dc40','2eb763f4-0b2f-417f-b232-5d38688dcdcf','2024-05-29','2024-01-30','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('546101da-27f9-4d36-849a-2ff3665800ea','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','08e45d25-9805-43e5-9d9f-e4a9f62e5860','2023-09-16','2023-03-11','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('cce41f90-6648-4ae2-bd07-baca6e46c154','dd588b33-76f9-4032-a754-6aa34e26de7b','1ea90ad2-861c-40f2-af5d-ad8b55b1e946','2023-12-29','2023-03-31','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('adcd90cd-e764-4fe8-8c26-9e0aa21cb017','dd588b33-76f9-4032-a754-6aa34e26de7b','13e643d4-40c1-4b7a-9544-c45569f4f9be','2024-05-02','2023-05-15','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','0e0de678-2463-4d3d-bc65-9b26b9b20ab2','2023-08-10','2024-03-04','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','8f92e218-6f32-4856-960a-834274fcc0ef','2023-12-06','2024-01-27','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('7280906d-97fa-479f-b257-c9f2d7bfb6ba','183bf829-76c2-44c7-8a20-b5c8b073efcb','82ecb998-810e-4363-8a8c-6c05e05e35c8','2024-04-13','2023-03-15','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('9e0fdce5-e985-4fca-991f-6cc8eccc65f5','183bf829-76c2-44c7-8a20-b5c8b073efcb','d923283d-1a1a-44c8-9a0a-1202d3f1bf04','2023-10-06','2024-05-21','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','9a826476-3d40-47b3-a2e5-44298aa72491','2024-04-17','2023-01-18','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','8ce6086d-97d1-4613-8fc5-bd73f313d6a0','2023-02-07','2023-07-04','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('52b1a258-b7ab-49d3-a7e5-af564a3cd20a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','9563ac7d-53bc-4154-a7d7-6445d57f3a04','2024-04-19','2023-04-06','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('89e7214a-055d-45d6-ad43-cc091da33ca2','183bf829-76c2-44c7-8a20-b5c8b073efcb','4e60a46b-7c8d-4836-ad98-0f7d0645eaba','2024-01-24','2024-04-09','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a2db8651-cf91-4310-a717-1ebb8074950f','183bf829-76c2-44c7-8a20-b5c8b073efcb','ed03727d-c247-47e0-81ec-a385ec88095a','2023-12-23','2024-05-07','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','e85f4e9e-a367-4fb6-a701-2980e2c2a1b8','2023-12-10','2024-05-02','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('85041be6-cf8d-4194-8aaf-72ef4122002a','183bf829-76c2-44c7-8a20-b5c8b073efcb','b0ab4063-bf46-4aed-843c-8252e1fa61ae','2024-04-09','2023-09-14','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('5dc072a6-d336-46a9-803f-3ecc4e5fdcaf','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','57b36704-8f32-452a-8fc6-82f2ea118093','2024-06-28','2024-04-20','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('adcd90cd-e764-4fe8-8c26-9e0aa21cb017','dd588b33-76f9-4032-a754-6aa34e26de7b','31b8ce3e-a819-4d90-a9f3-fadd63cfb5fe','2024-05-24','2023-05-18','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('a2db8651-cf91-4310-a717-1ebb8074950f','183bf829-76c2-44c7-8a20-b5c8b073efcb','52c561d2-ab0f-470c-b5c9-20baf07223c2','2023-05-20','2023-11-12','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('9ef92827-bbf9-4924-b91d-40b5e0ccd5f6','183bf829-76c2-44c7-8a20-b5c8b073efcb','02daeb0d-d0ef-4c01-85cf-c895b7d94156','2023-05-31','2024-05-20','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('a47212ba-9472-4921-95a3-55adb48b6ada','dd588b33-76f9-4032-a754-6aa34e26de7b','80b8a4ad-0861-46f0-9559-30be4489af7d','2023-12-01','2023-09-22','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('a1562999-410e-466e-9d01-11c2f0846077','183bf829-76c2-44c7-8a20-b5c8b073efcb','027aedc3-df08-4475-af52-9bf7785e49cd','2023-07-24','2024-01-31','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('2ae67883-12f5-441c-81bf-6b3ba94b71de','679d63bc-b896-480b-be7f-c48780872ba6','e4dec3d5-c5ba-4a6d-a2b9-3dd514ffb91e','2023-10-11','2024-05-01','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('eb771fd1-d7c7-4ca5-ac40-a797f7a87e08','2b94d71e-6311-4069-944f-d90c3206dc40','46c36b7e-ed5d-4895-bf9f-0dbc8953670e','2023-08-31','2024-04-14','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('875a9117-fd70-4f90-902a-91c04a7e6727','183bf829-76c2-44c7-8a20-b5c8b073efcb','1d717dfe-5d76-4c5b-b830-1dc950f1cef5','2023-10-05','2023-02-12','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('2b5b6b54-0639-42fc-a16d-9dc374639005','679d63bc-b896-480b-be7f-c48780872ba6','64528340-3c1d-4539-9bd6-c65bfd99333e','2023-06-13','2024-06-20','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('5dcad327-7a64-450e-89fd-d6047499d84a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','b64449c6-6f5b-408f-9b59-368afc4dbf7c','2023-06-19','2024-04-29','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('c849f32a-85f8-4455-bd20-ddf29cbd187a','dd588b33-76f9-4032-a754-6aa34e26de7b','a1db345f-9d63-41d7-a32c-3dc94a8aaeed','2023-03-02','2023-06-06','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('c2152a68-b0a0-45ac-88a8-ceea7947948e','dd588b33-76f9-4032-a754-6aa34e26de7b','df98cbfd-3c7e-41c7-9034-7aac0d963c94','2023-04-18','2023-06-24','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('b06251b8-a11b-4e92-8c79-2f57cacd59ec','dd588b33-76f9-4032-a754-6aa34e26de7b','b4705761-4939-478c-a68b-0038565efaab','2024-02-17','2023-11-08','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','7cb4fe7b-9528-4904-8fae-04fa26df6779','2024-05-21','2023-12-26','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('51372890-bb9c-4f47-ab23-83d1411aead1','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','5416c611-804e-4244-8be6-d3bfec1db277','2023-10-18','2023-08-03','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('9e0fdce5-e985-4fca-991f-6cc8eccc65f5','183bf829-76c2-44c7-8a20-b5c8b073efcb','ddc3d7a0-82ec-4726-802e-7bceaf30f662','2023-03-17','2023-06-23','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('bd2edd61-412a-433a-9d5a-e3096ee943db','dd588b33-76f9-4032-a754-6aa34e26de7b','36a04a40-3349-4c90-bbcd-1247f3e84d88','2024-06-11','2023-11-02','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('9e0fdce5-e985-4fca-991f-6cc8eccc65f5','183bf829-76c2-44c7-8a20-b5c8b073efcb','0aed4721-7b01-4bb6-a19d-39d144e508d5','2023-07-27','2024-04-24','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','427028e6-0508-4559-9e56-60fd446530a0','2024-06-20','2023-04-19','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('fbaddd3a-4116-40ea-a8ac-52aab1849697','2b94d71e-6311-4069-944f-d90c3206dc40','cc4a10c2-4741-4e40-8f92-cd12767b9a28','2023-01-01','2023-08-25','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('546101da-27f9-4d36-849a-2ff3665800ea','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','9a54d9af-fed0-42c1-b1c2-bc42b3d9c368','2023-10-25','2023-01-03','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('5213812f-8929-4f7d-9e1f-ce618613460c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','a1d3f0bd-b388-4a92-be1f-9192ab05a061','2023-07-09','2024-02-17','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('e8340470-366b-40b8-80e3-d36fb59cf325','2b94d71e-6311-4069-944f-d90c3206dc40','ccf02167-6365-4c58-a7e9-7cf0bacd30cc','2024-01-28','2024-02-16','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('968aaa29-7b8e-4adb-bcfe-0c3f0154c68f','183bf829-76c2-44c7-8a20-b5c8b073efcb','3d6d6115-33f6-462c-b384-75c5e55e5660','2023-10-25','2024-03-12','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('e2ec7e1b-4980-4e60-8805-03293530cc37','2b94d71e-6311-4069-944f-d90c3206dc40','bf705653-ea60-4260-a36b-794f8fd091fd','2023-05-13','2024-04-23','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('56f7f1af-c9ba-4fd3-b8b9-4068ac2fe5c3','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','8e287f4b-01c7-4282-8c3a-3c7aec803f4d','2024-04-05','2023-09-29','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('fac87498-7b32-48e5-842d-8f6e8a753b0e','2b94d71e-6311-4069-944f-d90c3206dc40','80659e83-63f8-4820-838c-9d59e71eda89','2024-07-03','2023-10-19','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('6a388309-2818-4170-8909-3167eb82df1e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','836ee22a-0811-40cf-93a5-687a14779a72','2024-06-28','2024-05-05','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','d804bd99-5b61-4364-8c07-4683130087de','2023-01-18','2023-12-09','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('bd2edd61-412a-433a-9d5a-e3096ee943db','dd588b33-76f9-4032-a754-6aa34e26de7b','c429764e-9f52-43d8-b060-b55cd5059b3d','2023-11-11','2023-01-12','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('9e0fdce5-e985-4fca-991f-6cc8eccc65f5','183bf829-76c2-44c7-8a20-b5c8b073efcb','0f699020-14b3-4aec-ae9f-a1b5b82a6b95','2023-09-15','2023-10-16','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('6534cb41-6517-4ef9-a84c-5685ee6f719d','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','904514cd-6ab1-4ad8-a480-5b13f040b721','2024-01-11','2023-05-07','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('bc2ea856-1419-4265-885a-77cb5f8965e0','dd588b33-76f9-4032-a754-6aa34e26de7b','225b1a78-501f-43d9-8076-dea3792e2b0c','2024-01-17','2024-02-15','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('89e7214a-055d-45d6-ad43-cc091da33ca2','183bf829-76c2-44c7-8a20-b5c8b073efcb','f588e49c-e331-449c-ae4b-f8ce4c1ef483','2023-09-18','2023-10-02','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('eb8539e3-7f81-4399-9872-6c8406858054','2b94d71e-6311-4069-944f-d90c3206dc40','28819bb6-3398-4d3e-9b5c-3b75277dd973','2023-06-01','2024-03-07','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('7280906d-97fa-479f-b257-c9f2d7bfb6ba','183bf829-76c2-44c7-8a20-b5c8b073efcb','d43c0105-0756-446f-b729-4eb10718e707','2023-04-23','2024-03-12','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('ab2532fd-4844-43a0-831a-b2ffa9a3ffba','dd588b33-76f9-4032-a754-6aa34e26de7b','fd722905-4f01-4464-8f8e-ff7049cd5962','2024-01-11','2023-12-29','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a3a9ee53-9c57-42e3-8d4f-147e4881dce7','dd588b33-76f9-4032-a754-6aa34e26de7b','618a7926-5928-43a6-bcb5-5fce15548fff','2023-07-23','2023-04-26','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('a2db8651-cf91-4310-a717-1ebb8074950f','183bf829-76c2-44c7-8a20-b5c8b073efcb','b1b3cec8-addb-4847-851c-7a0f2dbd27f0','2023-03-09','2024-05-09','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('e56e4383-5fed-4155-9a42-5d722b60e90d','2b94d71e-6311-4069-944f-d90c3206dc40','0f3617a7-7e7d-4adc-b9c0-30ec8798b142','2023-06-25','2023-09-18','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('ab2532fd-4844-43a0-831a-b2ffa9a3ffba','dd588b33-76f9-4032-a754-6aa34e26de7b','642566e5-7edd-4d11-bdf0-0ad5aca39147','2023-02-27','2023-07-15','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('6c06a496-88a8-40c0-a3f5-fa590c73b2fa','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','25e4d299-1f0d-4f5c-8f7a-bbc3358c0352','2023-08-12','2024-02-16','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','8944d1df-3b7b-42c7-b175-60bbb9841ef6','2023-09-20','2023-10-14','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('fd1c3dfc-c0e6-4cc2-bab7-c67e026bb939','2b94d71e-6311-4069-944f-d90c3206dc40','53e27d9b-3129-4929-8f8c-4bb42f56f3cc','2024-02-26','2023-09-11','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','5fb053bc-f450-4ac4-92c4-62d6615c8af7','2024-07-08','2023-03-28','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('56f7f1af-c9ba-4fd3-b8b9-4068ac2fe5c3','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','a5fc15ea-b25b-4342-bf2c-99ef6026b468','2023-09-26','2024-02-25','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('d66b2d2c-023c-48df-b3e3-4f79841d10aa','dd588b33-76f9-4032-a754-6aa34e26de7b','c4729fe6-b48b-4dd8-9b2b-70ffe11666f3','2023-09-17','2023-06-14','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('c2152a68-b0a0-45ac-88a8-ceea7947948e','dd588b33-76f9-4032-a754-6aa34e26de7b','b1b17721-d2e5-4501-9857-889a8cf98160','2023-12-28','2024-06-14','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('e2ec7e1b-4980-4e60-8805-03293530cc37','2b94d71e-6311-4069-944f-d90c3206dc40','250f45a3-38bc-4933-8a20-9a661c9ba18d','2023-05-29','2024-07-01','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('d66b2d2c-023c-48df-b3e3-4f79841d10aa','dd588b33-76f9-4032-a754-6aa34e26de7b','85a1b6ea-e097-4258-8800-d34cad85c834','2023-04-14','2024-05-03','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('bd2edd61-412a-433a-9d5a-e3096ee943db','dd588b33-76f9-4032-a754-6aa34e26de7b','7fed852e-ae1d-4f7a-8477-9fc9f0f884a4','2023-05-22','2024-04-28','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('47c8a66c-1f67-49c4-b275-86d357254c35','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','ae8f2c9e-5c6e-41d6-afa6-3060abfefcf7','2024-03-03','2023-12-12','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('6a388309-2818-4170-8909-3167eb82df1e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','bac3cf4a-d117-46cc-8159-9c1d9a311a1a','2024-03-24','2023-08-30','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('7e8795e8-325f-4e65-970a-e58430316ea7','183bf829-76c2-44c7-8a20-b5c8b073efcb','881872fb-1c61-40cc-8432-b9d5d9b32cec','2023-11-16','2023-07-08','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('d66b2d2c-023c-48df-b3e3-4f79841d10aa','dd588b33-76f9-4032-a754-6aa34e26de7b','84d4f3c4-8400-45b6-8941-a2f48b2b8d83','2023-02-11','2023-12-18','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('fa99041b-810d-4486-9689-ef904e7e56a3','2b94d71e-6311-4069-944f-d90c3206dc40','3b13c036-ff01-4678-889d-caec0974e585','2024-03-17','2024-02-17','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('993ff139-1fb7-4da7-98e0-62eff86a96e7','183bf829-76c2-44c7-8a20-b5c8b073efcb','abc60e01-86c1-43e6-a5d8-36e2c40cd634','2023-07-03','2023-08-05','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('dfc13311-c09a-4485-872e-7b4411fb23a1','2b94d71e-6311-4069-944f-d90c3206dc40','9c82bada-bd49-476f-a14d-e84b09728d95','2024-06-21','2023-05-17','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('2653569d-07f8-4729-81e9-ef6a53d11b76','679d63bc-b896-480b-be7f-c48780872ba6','7b959225-92a5-4b0e-b2af-caa54e958620','2024-03-31','2023-04-05','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('968aaa29-7b8e-4adb-bcfe-0c3f0154c68f','183bf829-76c2-44c7-8a20-b5c8b073efcb','1f30b1c3-9046-47fe-95d1-c97141617efb','2023-02-14','2023-05-05','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('c83a56d6-c676-43dc-a858-d3aa801bbf61','dd588b33-76f9-4032-a754-6aa34e26de7b','4dbe8811-1413-4b22-8eb8-85f76a616019','2024-07-10','2023-03-19','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('546101da-27f9-4d36-849a-2ff3665800ea','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','ee45def3-eb3e-43a8-98a8-12085331fbfa','2024-01-22','2023-09-06','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','c9ffb294-944e-4618-b40b-c0f6a7687f1e','2023-11-17','2023-01-26','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('e2ec7e1b-4980-4e60-8805-03293530cc37','2b94d71e-6311-4069-944f-d90c3206dc40','9e2029d7-a1bd-4628-9202-207481406a41','2023-03-26','2023-04-02','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('348a9a95-f1a3-412d-9824-894cd77f1e3a','679d63bc-b896-480b-be7f-c48780872ba6','392d31cf-e6cf-40c4-8b6b-fd05ccd42c18','2024-04-07','2023-10-18','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('c991a456-859a-4f5f-8864-97a682c519a3','dd588b33-76f9-4032-a754-6aa34e26de7b','4da8b5c5-17f7-4f29-8c56-6ba9cdca1ba4','2024-03-29','2024-06-15','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a1562999-410e-466e-9d01-11c2f0846077','183bf829-76c2-44c7-8a20-b5c8b073efcb','8963e52a-a91c-4b1c-b6cc-6351a189c321','2024-06-07','2024-05-01','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a3a9ee53-9c57-42e3-8d4f-147e4881dce7','dd588b33-76f9-4032-a754-6aa34e26de7b','56310ee1-6cc4-4fa7-85bd-c1261f77cbf3','2023-04-17','2023-02-16','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('c2152a68-b0a0-45ac-88a8-ceea7947948e','dd588b33-76f9-4032-a754-6aa34e26de7b','67eba32a-f11b-4e61-a428-e17c1113d5c8','2023-03-11','2024-03-25','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('a2db8651-cf91-4310-a717-1ebb8074950f','183bf829-76c2-44c7-8a20-b5c8b073efcb','cd694ec9-53ce-494a-b859-1ed0a14f8e56','2024-02-12','2024-01-07','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','52c99aca-c7ba-498f-a724-dbc568fa9edb','2024-03-17','2023-07-01','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('5dcad327-7a64-450e-89fd-d6047499d84a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','ed2e8be7-0345-4ccd-b1ca-b2b8b4e0a80c','2023-07-24','2023-08-31','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('7280906d-97fa-479f-b257-c9f2d7bfb6ba','183bf829-76c2-44c7-8a20-b5c8b073efcb','fdd8aa6c-42d3-45e2-9643-08aef41dfb11','2023-06-29','2023-11-09','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('bc2ea856-1419-4265-885a-77cb5f8965e0','dd588b33-76f9-4032-a754-6aa34e26de7b','613551c5-07bd-4ec3-a953-4f2d6cd4f239','2023-04-17','2023-05-16','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('7643d20f-356c-4f8b-a909-7b9c1815ca95','183bf829-76c2-44c7-8a20-b5c8b073efcb','2b6e4e2d-51ca-44d1-8d59-3f38cefd9f80','2023-01-28','2023-03-09','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('3c67c06e-5feb-43c7-97bc-29754e602ec8','679d63bc-b896-480b-be7f-c48780872ba6','aa6bd26f-7887-4b1d-a8db-d4e3c14dcf40','2023-07-29','2023-01-17','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('5ab65223-ff3e-4d46-b3b4-2ecb9e68add9','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','0727ff7b-d82b-4d09-a887-0b68bd1ad549','2023-10-19','2024-03-06','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('6a388309-2818-4170-8909-3167eb82df1e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','abad34fe-664a-4893-b19a-a9398e570634','2023-06-22','2023-09-21','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('dfc13311-c09a-4485-872e-7b4411fb23a1','2b94d71e-6311-4069-944f-d90c3206dc40','1e359e86-4abf-43dc-b459-b4a020459312','2023-02-19','2024-04-27','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('3c67c06e-5feb-43c7-97bc-29754e602ec8','679d63bc-b896-480b-be7f-c48780872ba6','92b767f6-93a3-471c-a56a-c20c196beb43','2023-01-29','2023-08-17','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','ad6183a3-685f-489b-a553-9ce856c228e1','2023-01-22','2023-12-30','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('5a8223b4-ca9f-4698-ac36-bdc6d3f0bc66','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','b45b23b3-de23-41d9-935d-9a104481eefd','2023-10-25','2023-09-18','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','e918cd79-944f-47d8-b475-b1890a947035','2023-09-13','2023-01-05','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('3c67c06e-5feb-43c7-97bc-29754e602ec8','679d63bc-b896-480b-be7f-c48780872ba6','0b0bdb6e-61d8-4a91-9e03-bae3d450c1cf','2024-02-14','2023-01-19','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('50da1ec7-c569-41b9-abac-1559cb7ac89c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','e04babac-6f52-4730-8aa2-40a7417e887f','2023-12-16','2023-12-22','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('dfc13311-c09a-4485-872e-7b4411fb23a1','2b94d71e-6311-4069-944f-d90c3206dc40','3c5a85ef-a145-4c4b-a7b4-e2bc8d0471b6','2023-12-27','2023-08-30','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('875a9117-fd70-4f90-902a-91c04a7e6727','183bf829-76c2-44c7-8a20-b5c8b073efcb','1b28442b-7bc3-4ea9-a9d4-7f139d23d63d','2023-03-16','2023-08-28','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('546101da-27f9-4d36-849a-2ff3665800ea','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','d771732e-13be-4923-bb20-408f81ab4e00','2023-05-12','2024-01-09','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('5d4f5cc4-f636-496a-953b-975485db9258','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','06d9d860-6f91-43b2-b2b0-05fb0f99dabf','2023-11-09','2023-09-07','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('f12147b1-8d2b-471a-b2a3-81d1c5f31c11','2b94d71e-6311-4069-944f-d90c3206dc40','baa2e460-8e30-41ea-9635-cb2b3c6eca76','2024-06-07','2024-05-17','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','e3d0bf7f-3829-4031-806b-843089260db9','2023-06-23','2024-05-11','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('f8b3eac7-fd48-4d8d-abf9-87eb94f7ed98','2b94d71e-6311-4069-944f-d90c3206dc40','fb3f4eb0-198d-4970-bd92-d31ac30760c4','2023-08-16','2023-09-09','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('fd1c3dfc-c0e6-4cc2-bab7-c67e026bb939','2b94d71e-6311-4069-944f-d90c3206dc40','01c9a048-a105-4325-8605-269075bd16ec','2023-02-17','2023-12-13','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('dfc13311-c09a-4485-872e-7b4411fb23a1','2b94d71e-6311-4069-944f-d90c3206dc40','4c6057d2-1938-4c9d-b3bf-a3c1194e1f34','2023-01-30','2023-11-13','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','70db5121-2545-4baa-829d-e4d88d03ac31','2023-07-09','2023-01-03','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('fa99041b-810d-4486-9689-ef904e7e56a3','2b94d71e-6311-4069-944f-d90c3206dc40','90074551-7c2f-40ad-ad07-1fc20ed29687','2023-12-24','2023-04-08','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('d66b2d2c-023c-48df-b3e3-4f79841d10aa','dd588b33-76f9-4032-a754-6aa34e26de7b','7a0bf5d4-c6bb-4db5-9e4c-9befb500f572','2023-06-16','2023-10-29','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('bc2ea856-1419-4265-885a-77cb5f8965e0','dd588b33-76f9-4032-a754-6aa34e26de7b','a55591c7-48ad-4c64-a76e-c4b413ab0485','2023-03-21','2023-11-15','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('9ef92827-bbf9-4924-b91d-40b5e0ccd5f6','183bf829-76c2-44c7-8a20-b5c8b073efcb','ff2575c8-206a-42aa-936c-f6418a334794','2023-10-20','2023-03-04','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','90d2cd64-4f81-4bd4-9479-6329a7e97d68','2023-01-17','2023-07-17','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','60094e8d-50e3-48f4-89a0-8c426103f023','2024-05-21','2024-01-05','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','fa682bf8-ae15-49ee-a139-729cf7e1c843','2024-07-02','2024-02-17','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('50da1ec7-c569-41b9-abac-1559cb7ac89c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','7300bd48-052d-4c15-b3ad-4b505f1babf1','2024-06-25','2024-01-09','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('5dcad327-7a64-450e-89fd-d6047499d84a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','cfa3afb3-cf86-4cd7-a5cf-0838cb1305bc','2023-04-16','2023-03-08','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('993ff139-1fb7-4da7-98e0-62eff86a96e7','183bf829-76c2-44c7-8a20-b5c8b073efcb','cc3aa1cf-39d9-4be9-a587-7f4f1175715b','2023-10-08','2024-02-21','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('dd36cf94-b0ec-490a-acd8-1a99a6686601','2b94d71e-6311-4069-944f-d90c3206dc40','fc083969-0a33-491a-863d-b5403dc58ae4','2023-05-07','2023-03-31','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('56f7f1af-c9ba-4fd3-b8b9-4068ac2fe5c3','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','9d94a266-ce44-42f8-8fbc-700a8c44adba','2024-03-24','2024-04-09','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('6c06a496-88a8-40c0-a3f5-fa590c73b2fa','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','fdad8dd0-49d8-4674-bcfe-38b576b5e4f1','2024-03-06','2023-02-27','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('4afd9e20-2e32-47de-a59b-a485fa333b0b','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','2ffdee69-2961-4ca2-b9c3-45bf0b885983','2024-04-13','2023-07-12','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('50da1ec7-c569-41b9-abac-1559cb7ac89c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','47b1306b-1154-4c75-ac58-3240de27ae19','2024-04-04','2023-12-16','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('82cd1bb4-f8cf-49fd-8cac-104fc0cbb024','183bf829-76c2-44c7-8a20-b5c8b073efcb','92a0a535-e3b2-4b6e-975c-d311937f93e5','2023-05-27','2023-06-30','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('5a8223b4-ca9f-4698-ac36-bdc6d3f0bc66','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','af42333a-24e2-4245-bf66-5d2a4750690b','2023-12-04','2024-05-02','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','c13f2616-f6b7-4452-ae2d-c4a04543ebf0','2024-02-14','2024-02-03','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('f8a48090-57fc-4dc0-a435-54fb78a304eb','2b94d71e-6311-4069-944f-d90c3206dc40','d7d75455-739f-4ad5-88ad-6b98d68df1e0','2024-03-27','2023-10-22','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('56f7f1af-c9ba-4fd3-b8b9-4068ac2fe5c3','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','308b4651-38fc-4660-ba40-56334cf94db4','2023-08-29','2023-09-05','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a3a9ee53-9c57-42e3-8d4f-147e4881dce7','dd588b33-76f9-4032-a754-6aa34e26de7b','7c53abae-de25-4e8b-b605-bacb4fd3167e','2023-10-04','2023-06-22','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('bc2ea856-1419-4265-885a-77cb5f8965e0','dd588b33-76f9-4032-a754-6aa34e26de7b','cfbbbbe0-b4ab-43cc-87ad-8a63233f5f3a','2023-09-20','2023-10-21','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('51372890-bb9c-4f47-ab23-83d1411aead1','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','60932b17-6168-4ad1-9edf-7b3f384911bb','2023-02-12','2023-06-25','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('a55211af-ebef-4ac7-bac9-be25c2ea3820','dd588b33-76f9-4032-a754-6aa34e26de7b','089ed6b5-576c-4f2c-b812-201d51dab6a7','2023-10-24','2023-04-02','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('56f7f1af-c9ba-4fd3-b8b9-4068ac2fe5c3','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','3533a387-b4f0-44e1-b89d-22e2ca379b10','2023-01-26','2024-07-10','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','cedb8a3f-7178-4e26-972d-0c6913fd1225','2023-10-21','2024-05-13','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('2b5b6b54-0639-42fc-a16d-9dc374639005','679d63bc-b896-480b-be7f-c48780872ba6','bfee4d73-fd3d-41d2-84b4-b76ab4da830f','2023-06-23','2024-04-09','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('1c797c78-d1ee-4156-9138-78901e588bf0','679d63bc-b896-480b-be7f-c48780872ba6','b1a86ab4-3e52-40bf-af57-754eccfa8806','2023-02-08','2024-03-16','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('f3870de4-1893-4518-8007-4892dc227872','2b94d71e-6311-4069-944f-d90c3206dc40','96e9433c-3bb9-443e-8501-fdb913906bf8','2023-03-04','2023-09-26','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('51372890-bb9c-4f47-ab23-83d1411aead1','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','95ff9c36-e1e0-4595-b1b1-aeb0a4e17c55','2023-09-14','2024-03-10','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('51372890-bb9c-4f47-ab23-83d1411aead1','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','9107b7b9-6e16-4eb4-8e45-30cbda9be6a5','2023-02-15','2024-05-13','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('5ab65223-ff3e-4d46-b3b4-2ecb9e68add9','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','75b7a5ff-580c-460c-b4d0-765554bc39e7','2023-02-03','2024-01-08','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a47212ba-9472-4921-95a3-55adb48b6ada','dd588b33-76f9-4032-a754-6aa34e26de7b','e8434c89-2275-45be-9677-b238b8dab82e','2024-01-02','2024-02-29','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','f42bc1ae-0a17-4484-ac97-f103d7e36580','2024-05-07','2024-04-24','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('a3a9ee53-9c57-42e3-8d4f-147e4881dce7','dd588b33-76f9-4032-a754-6aa34e26de7b','ebd3f63a-1794-4d74-88f0-6285bd34260b','2023-12-20','2023-04-20','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','3da22643-b344-499e-95b7-f551f496e477','2023-04-17','2023-10-18','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('89e7214a-055d-45d6-ad43-cc091da33ca2','183bf829-76c2-44c7-8a20-b5c8b073efcb','64df6de9-a3f4-4fd9-952a-6f2730d1c41b','2024-07-01','2023-03-31','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('ab2532fd-4844-43a0-831a-b2ffa9a3ffba','dd588b33-76f9-4032-a754-6aa34e26de7b','8ec3e84e-fa48-46a4-8176-1f5f55175cae','2023-06-13','2023-05-28','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('f8b3eac7-fd48-4d8d-abf9-87eb94f7ed98','2b94d71e-6311-4069-944f-d90c3206dc40','98e6a13c-176c-4a23-a346-3239f6bdab03','2023-06-06','2023-05-31','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('e56e4383-5fed-4155-9a42-5d722b60e90d','2b94d71e-6311-4069-944f-d90c3206dc40','0728fc09-cd17-48e4-9cf3-6931f4fbe308','2024-04-29','2023-05-05','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('7643d20f-356c-4f8b-a909-7b9c1815ca95','183bf829-76c2-44c7-8a20-b5c8b073efcb','1e258321-ff71-408a-a449-706805e43971','2024-04-04','2023-09-08','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('ed88f150-de85-4b7e-b40e-dae8d3666365','2b94d71e-6311-4069-944f-d90c3206dc40','3e156756-4c81-4a12-9ff6-60ae6d2a8cf5','2023-07-02','2023-01-23','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('f8b3eac7-fd48-4d8d-abf9-87eb94f7ed98','2b94d71e-6311-4069-944f-d90c3206dc40','1ed5c0f1-edeb-490e-80ea-77648028f3ac','2023-04-13','2023-04-30','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('f8a48090-57fc-4dc0-a435-54fb78a304eb','2b94d71e-6311-4069-944f-d90c3206dc40','4a091c0b-4854-4f92-9f8c-c378a5f33b56','2023-03-03','2023-05-31','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('2b5b6b54-0639-42fc-a16d-9dc374639005','679d63bc-b896-480b-be7f-c48780872ba6','0b357122-8fd5-4b87-9b64-64d7e01497c3','2024-07-08','2023-08-18','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','59afcfa5-03bf-4cee-adfb-9b119872b31d','2023-12-18','2024-05-04','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('348a9a95-f1a3-412d-9824-894cd77f1e3a','679d63bc-b896-480b-be7f-c48780872ba6','fe44bf3a-b489-4a9e-b112-166f55f874e8','2023-05-20','2023-12-09','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('d772aa6a-990c-4a23-83b8-5fb43148df36','dd588b33-76f9-4032-a754-6aa34e26de7b','b8844091-a039-4178-a725-dcc2a9ad5e14','2023-05-21','2023-08-21','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('5d4f5cc4-f636-496a-953b-975485db9258','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','6c871900-8121-4215-8666-ff771329efd8','2023-08-17','2023-03-17','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('d66b2d2c-023c-48df-b3e3-4f79841d10aa','dd588b33-76f9-4032-a754-6aa34e26de7b','34dcee8e-1b1d-4455-a3e0-33a1b859a5f3','2024-01-02','2023-03-25','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('82cd1bb4-f8cf-49fd-8cac-104fc0cbb024','183bf829-76c2-44c7-8a20-b5c8b073efcb','6e0a1691-549e-4055-9872-581bb63d4e1c','2023-09-11','2023-05-22','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('4e4f2a4b-0697-4ef6-ad53-1094c1c181b6','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','1133be08-746d-4cb3-8599-ea8559d12f9c','2023-11-18','2024-03-26','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('fbaddd3a-4116-40ea-a8ac-52aab1849697','2b94d71e-6311-4069-944f-d90c3206dc40','32ef478a-1ad8-40a4-9668-cb378d71d52a','2023-10-25','2023-11-01','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('8d26c0ec-2fcd-4080-a114-3b568ff4224b','183bf829-76c2-44c7-8a20-b5c8b073efcb','3e2d6dcd-95b5-4065-be48-d65647d064ff','2024-06-02','2023-09-05','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('1c797c78-d1ee-4156-9138-78901e588bf0','679d63bc-b896-480b-be7f-c48780872ba6','f86418f7-673b-4f31-a5ee-64a24b6b3dfe','2023-07-08','2023-07-02','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('a1562999-410e-466e-9d01-11c2f0846077','183bf829-76c2-44c7-8a20-b5c8b073efcb','5d3ffc23-6927-4e87-a9b5-69774c323e99','2024-07-03','2023-10-12','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('dfc13311-c09a-4485-872e-7b4411fb23a1','2b94d71e-6311-4069-944f-d90c3206dc40','61af3d3c-5216-4083-988a-1aae3ded351b','2023-05-25','2023-02-21','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','78460d2f-a9f4-4af0-8209-fe823d26ad47','2023-09-25','2024-03-16','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('a1562999-410e-466e-9d01-11c2f0846077','183bf829-76c2-44c7-8a20-b5c8b073efcb','b372731d-d463-4df4-8f16-a52d71e6091a','2023-03-23','2023-08-12','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('eb771fd1-d7c7-4ca5-ac40-a797f7a87e08','2b94d71e-6311-4069-944f-d90c3206dc40','246d0aa9-f40c-422d-bee5-281dd9272110','2023-04-03','2023-05-06','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('70ae8751-489d-4c64-9197-a80e93498e6e','183bf829-76c2-44c7-8a20-b5c8b073efcb','f2b08811-177c-48e2-bcde-980d3c5cf3be','2023-08-08','2023-06-22','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('42f792d5-a5e2-40f5-b902-898c8da3b040','679d63bc-b896-480b-be7f-c48780872ba6','866f8089-984c-4ec7-bb3c-598f35075d95','2023-08-26','2023-09-15','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('c849f32a-85f8-4455-bd20-ddf29cbd187a','dd588b33-76f9-4032-a754-6aa34e26de7b','4bd71e9b-380f-44da-b732-ba0cae8ec44f','2024-01-25','2023-07-19','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('f8b3eac7-fd48-4d8d-abf9-87eb94f7ed98','2b94d71e-6311-4069-944f-d90c3206dc40','5e35fe55-c749-4a0f-a2ae-82e4e827b4c7','2024-05-16','2024-01-31','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','24b1f083-97d8-404f-abe1-0d624a07c3ea','2023-11-12','2023-10-22','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('fac87498-7b32-48e5-842d-8f6e8a753b0e','2b94d71e-6311-4069-944f-d90c3206dc40','d98c6b54-0f67-4e44-a520-dfed14f55ba3','2023-12-26','2024-03-29','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('b9c36c7f-dd96-44f8-88f8-ffdf6be81344','dd588b33-76f9-4032-a754-6aa34e26de7b','c2fdff4e-6360-46c6-8a05-3bee417d3fdc','2024-05-11','2023-07-20','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('52b1a258-b7ab-49d3-a7e5-af564a3cd20a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','75fdbc30-0bd5-4737-9eba-f990499e5727','2024-02-27','2023-11-12','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('bc2ea856-1419-4265-885a-77cb5f8965e0','dd588b33-76f9-4032-a754-6aa34e26de7b','62ae9d3a-cb38-4415-aa65-1b5ae0808e8b','2023-12-22','2024-07-02','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('da1909ce-a694-43d8-9a4d-b9e2e825269c','2b94d71e-6311-4069-944f-d90c3206dc40','41e0c5ff-2e3f-40e0-902c-07405cbffb89','2024-01-15','2024-04-08','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('42f792d5-a5e2-40f5-b902-898c8da3b040','679d63bc-b896-480b-be7f-c48780872ba6','7f8e02a7-72e2-43e1-905e-25ea46bbbb4a','2024-01-12','2023-09-21','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','bca96d99-28d5-4b01-80da-135d23ba97f2','2023-10-25','2023-08-12','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('c2152a68-b0a0-45ac-88a8-ceea7947948e','dd588b33-76f9-4032-a754-6aa34e26de7b','d522ee6b-023d-486f-8bea-af276eddd35a','2024-02-21','2024-05-24','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('c849f32a-85f8-4455-bd20-ddf29cbd187a','dd588b33-76f9-4032-a754-6aa34e26de7b','1b0df426-dd09-4d64-9401-b4d50bad0e96','2023-01-12','2024-04-28','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('fac87498-7b32-48e5-842d-8f6e8a753b0e','2b94d71e-6311-4069-944f-d90c3206dc40','c5986595-1a99-4eff-8fa2-8d70152e652a','2023-03-19','2023-03-08','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','c33e0fdc-17cc-49da-9220-d2b7eca09ee3','2023-06-07','2023-09-22','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('f8b3eac7-fd48-4d8d-abf9-87eb94f7ed98','2b94d71e-6311-4069-944f-d90c3206dc40','bc43cfb1-594e-4838-aa30-75b42b5400ce','2023-04-08','2023-06-30','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('f12147b1-8d2b-471a-b2a3-81d1c5f31c11','2b94d71e-6311-4069-944f-d90c3206dc40','62ece1e7-3d62-47d3-b039-309e113af734','2023-05-13','2023-01-16','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('b06251b8-a11b-4e92-8c79-2f57cacd59ec','dd588b33-76f9-4032-a754-6aa34e26de7b','456c9fae-8a69-47e5-b23e-066106b84616','2024-03-16','2023-06-23','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','ceb76593-2222-4a0d-957f-b11c870a2ab6','2024-03-21','2024-04-24','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('dfc13311-c09a-4485-872e-7b4411fb23a1','2b94d71e-6311-4069-944f-d90c3206dc40','4969624b-ff0f-4693-a606-5d6563b18e16','2023-01-31','2024-02-08','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('5dcad327-7a64-450e-89fd-d6047499d84a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','60ef99fd-8a77-431d-b0fa-633a2f9fe1c2','2023-05-20','2023-12-16','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('eb771fd1-d7c7-4ca5-ac40-a797f7a87e08','2b94d71e-6311-4069-944f-d90c3206dc40','c9cae525-5806-4019-a0ab-33c079f87771','2023-10-15','2023-10-25','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('dfc13311-c09a-4485-872e-7b4411fb23a1','2b94d71e-6311-4069-944f-d90c3206dc40','c58b0b3a-c950-495e-95e6-10bec4aab765','2024-02-01','2024-05-09','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('5dc072a6-d336-46a9-803f-3ecc4e5fdcaf','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','d9599af1-ade9-44c0-b6cf-5997d40f2e98','2023-04-20','2023-01-10','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('79b97c21-87e5-49e5-80a6-0ff60e1a40d4','183bf829-76c2-44c7-8a20-b5c8b073efcb','3ee47232-59da-48c6-982e-2061b847ab8b','2023-07-13','2024-01-27','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('a309ddfd-b618-4adb-8f29-2fd427e3ad09','dd588b33-76f9-4032-a754-6aa34e26de7b','46abecd2-4514-4d96-bb5f-b3fcce7964d6','2023-03-25','2024-01-19','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('e8340470-366b-40b8-80e3-d36fb59cf325','2b94d71e-6311-4069-944f-d90c3206dc40','108a2b98-273f-4dbd-8e47-418eda4c1080','2023-09-14','2023-11-22','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('89e7214a-055d-45d6-ad43-cc091da33ca2','183bf829-76c2-44c7-8a20-b5c8b073efcb','9b7b9189-4703-4e6c-a5ea-f4f107ec2380','2023-08-23','2023-10-19','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('a1562999-410e-466e-9d01-11c2f0846077','183bf829-76c2-44c7-8a20-b5c8b073efcb','2e60a853-bed2-4e33-aae9-f26eaaf374ce','2024-03-14','2023-08-27','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('bd2edd61-412a-433a-9d5a-e3096ee943db','dd588b33-76f9-4032-a754-6aa34e26de7b','c7721681-b129-4a01-9608-d5457a729a6c','2024-05-17','2024-01-20','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('968aaa29-7b8e-4adb-bcfe-0c3f0154c68f','183bf829-76c2-44c7-8a20-b5c8b073efcb','a71cf478-5f86-49b2-82b0-dee179501a5d','2023-11-17','2023-10-06','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('348a9a95-f1a3-412d-9824-894cd77f1e3a','679d63bc-b896-480b-be7f-c48780872ba6','0d8c19a8-44ef-4a70-ab6a-fc5fdcf1fa5e','2023-12-09','2023-05-17','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('546101da-27f9-4d36-849a-2ff3665800ea','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','3ea84b77-ba58-4af6-bd70-5095a2b5b2c6','2024-05-19','2024-06-19','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('85041be6-cf8d-4194-8aaf-72ef4122002a','183bf829-76c2-44c7-8a20-b5c8b073efcb','69b53fde-f25f-4f91-9983-0035662a2786','2024-04-04','2023-08-06','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('7e8795e8-325f-4e65-970a-e58430316ea7','183bf829-76c2-44c7-8a20-b5c8b073efcb','9da5b1b3-c760-4153-959e-77e2cdadd0dd','2023-04-21','2023-09-19','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('85041be6-cf8d-4194-8aaf-72ef4122002a','183bf829-76c2-44c7-8a20-b5c8b073efcb','4536eb28-ec17-47ea-8b07-f2afbb02e74b','2024-03-17','2023-06-02','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('56f7f1af-c9ba-4fd3-b8b9-4068ac2fe5c3','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','c5562848-3907-4f24-98dc-2b4e5353cb07','2023-03-03','2024-04-10','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('875a9117-fd70-4f90-902a-91c04a7e6727','183bf829-76c2-44c7-8a20-b5c8b073efcb','85d41107-fc6b-4d3c-bec5-7e1ef1642849','2024-05-21','2023-10-16','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('f12147b1-8d2b-471a-b2a3-81d1c5f31c11','2b94d71e-6311-4069-944f-d90c3206dc40','7b8f01fc-e930-4501-b462-ae5309214446','2023-02-01','2023-12-10','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('c83a56d6-c676-43dc-a858-d3aa801bbf61','dd588b33-76f9-4032-a754-6aa34e26de7b','8519302a-e03b-4231-8932-51c71a7a859a','2023-05-30','2023-03-12','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('3c67c06e-5feb-43c7-97bc-29754e602ec8','679d63bc-b896-480b-be7f-c48780872ba6','59a2656b-e7b6-41b9-89ac-0eeb03707ae9','2023-07-09','2024-05-07','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('5a8223b4-ca9f-4698-ac36-bdc6d3f0bc66','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','25290812-61d1-47c2-990d-3ed14cdcc648','2023-01-07','2024-04-03','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','dc9d1c61-78da-45a0-9367-dbb259375a53','2024-05-08','2024-04-18','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('d772aa6a-990c-4a23-83b8-5fb43148df36','dd588b33-76f9-4032-a754-6aa34e26de7b','a771826b-d99c-4707-8fc7-ad7a54215cf5','2023-04-17','2024-07-03','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('a55211af-ebef-4ac7-bac9-be25c2ea3820','dd588b33-76f9-4032-a754-6aa34e26de7b','9f4a9641-2456-4b00-a935-d68d7035cbe5','2024-03-06','2023-08-30','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('6c06a496-88a8-40c0-a3f5-fa590c73b2fa','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','05ed3a61-1960-457d-bf59-968f46049084','2023-01-03','2023-07-06','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('d895a409-9f03-43c0-946d-a9b1717afdc0','2b94d71e-6311-4069-944f-d90c3206dc40','6e04eca9-f6ce-4757-82c2-13f1883b704d','2023-07-20','2023-12-08','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('9e0fdce5-e985-4fca-991f-6cc8eccc65f5','183bf829-76c2-44c7-8a20-b5c8b073efcb','9a2b1a5a-110e-4a31-9e18-c0d6ace5f27e','2024-04-18','2024-04-09','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','c9e8b8ca-986e-46dd-b7f3-2720213a8473','2023-09-14','2023-10-20','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','cbd9a23f-49c9-46c2-a1d6-c9d8bc58f684','2024-01-08','2023-12-27','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('6c06a496-88a8-40c0-a3f5-fa590c73b2fa','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','0ea1c488-9c5a-4312-af38-f508008c0eb6','2023-11-27','2023-05-12','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('f3870de4-1893-4518-8007-4892dc227872','2b94d71e-6311-4069-944f-d90c3206dc40','a960ca2c-f3fe-4dd0-98f2-3803ec8335bf','2023-11-25','2023-07-15','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('a47212ba-9472-4921-95a3-55adb48b6ada','dd588b33-76f9-4032-a754-6aa34e26de7b','f5502aa6-5311-4c1d-beaa-d65389cb25f0','2023-01-24','2023-10-16','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('9ef92827-bbf9-4924-b91d-40b5e0ccd5f6','183bf829-76c2-44c7-8a20-b5c8b073efcb','2373c6c0-11bc-4dc4-9aa5-c5114a17cec6','2023-04-24','2023-07-25','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('42f792d5-a5e2-40f5-b902-898c8da3b040','679d63bc-b896-480b-be7f-c48780872ba6','a5b6335c-c5c9-4253-b0d6-af0024358bad','2023-03-13','2023-08-26','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('c991a456-859a-4f5f-8864-97a682c519a3','dd588b33-76f9-4032-a754-6aa34e26de7b','4198fc91-99dc-4be1-92e3-55ebbc7e741a','2023-10-19','2023-06-08','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('a1562999-410e-466e-9d01-11c2f0846077','183bf829-76c2-44c7-8a20-b5c8b073efcb','6cf04534-f722-4d2e-8642-0209cea56934','2023-12-08','2023-04-12','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('cce41f90-6648-4ae2-bd07-baca6e46c154','dd588b33-76f9-4032-a754-6aa34e26de7b','dc24c954-75d0-4b91-bd3e-8a861be90019','2023-10-09','2023-01-24','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('57756acc-a699-4e22-a102-829b7db54e57','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','9fb49f73-e502-4706-8a87-aef9f5be9a66','2023-03-05','2023-06-26','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('f3870de4-1893-4518-8007-4892dc227872','2b94d71e-6311-4069-944f-d90c3206dc40','34ed1da3-9226-4015-89e1-9d33e86a1238','2023-03-29','2023-06-10','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('b9c36c7f-dd96-44f8-88f8-ffdf6be81344','dd588b33-76f9-4032-a754-6aa34e26de7b','4a9a80c0-6ff3-4e89-b770-3f6f16581f91','2023-04-16','2024-02-09','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('9e0fdce5-e985-4fca-991f-6cc8eccc65f5','183bf829-76c2-44c7-8a20-b5c8b073efcb','2ba02f52-4917-4dea-8e9a-476df995cde4','2023-10-25','2023-03-08','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('c2152a68-b0a0-45ac-88a8-ceea7947948e','dd588b33-76f9-4032-a754-6aa34e26de7b','c9822941-cb04-4d82-840b-f51dc4c316b9','2023-09-04','2024-01-15','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('452aa4a9-191c-46f1-a106-7f4235681677','679d63bc-b896-480b-be7f-c48780872ba6','8a312fde-3c1c-4aa9-9914-4d84698ac2e8','2024-04-02','2024-04-01','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('adcd90cd-e764-4fe8-8c26-9e0aa21cb017','dd588b33-76f9-4032-a754-6aa34e26de7b','7a38df31-dd81-44fb-88a6-a759e71f46ff','2024-07-02','2023-03-27','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('875a9117-fd70-4f90-902a-91c04a7e6727','183bf829-76c2-44c7-8a20-b5c8b073efcb','8ac43e66-6be5-4cac-879d-ed1a88fd7d19','2023-03-11','2024-02-10','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('e56e4383-5fed-4155-9a42-5d722b60e90d','2b94d71e-6311-4069-944f-d90c3206dc40','c75e1574-0b62-43b5-b71f-d083dc5871c6','2024-01-26','2023-06-24','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('ab2532fd-4844-43a0-831a-b2ffa9a3ffba','dd588b33-76f9-4032-a754-6aa34e26de7b','7bb2602a-1d5e-44eb-aa0f-7cb9a72d02fd','2023-09-25','2023-06-19','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('fbaddd3a-4116-40ea-a8ac-52aab1849697','2b94d71e-6311-4069-944f-d90c3206dc40','d38ee714-d9b1-4a99-bc9f-915e8ddd0056','2023-01-16','2024-05-27','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('85041be6-cf8d-4194-8aaf-72ef4122002a','183bf829-76c2-44c7-8a20-b5c8b073efcb','b0fec0a1-f982-44b8-8f4c-86fdf307e6dd','2023-08-03','2024-03-13','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('52b1a258-b7ab-49d3-a7e5-af564a3cd20a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','f131c03a-6896-4d9f-8052-de79e2967c86','2024-07-03','2023-03-11','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('f8a48090-57fc-4dc0-a435-54fb78a304eb','2b94d71e-6311-4069-944f-d90c3206dc40','0080ec2d-0501-44f5-bd19-a120540a5586','2023-05-31','2024-02-23','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('4afd9e20-2e32-47de-a59b-a485fa333b0b','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','d05e432c-9704-41f3-8821-a1148c4905c0','2023-02-01','2023-07-25','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','b65fc9a0-6719-42d4-adaa-e6a95629cc4c','2023-11-22','2024-07-01','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('eb8539e3-7f81-4399-9872-6c8406858054','2b94d71e-6311-4069-944f-d90c3206dc40','0f3ca2a1-bbd4-47df-9ff0-2c086074e3f8','2023-02-16','2023-05-10','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('52b1a258-b7ab-49d3-a7e5-af564a3cd20a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','5d4419b9-7d7c-44e6-991f-ecbd9937c020','2023-10-24','2024-07-09','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','6ff77a0f-fd9b-4412-932a-23d0684fe1fe','2023-05-18','2024-06-19','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','0f52e6aa-23f5-4adb-946e-76a12bea1833','2023-05-02','2023-12-07','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('d772aa6a-990c-4a23-83b8-5fb43148df36','dd588b33-76f9-4032-a754-6aa34e26de7b','7c6778ab-02f2-44e2-9a6e-8df40abcbf8f','2023-10-10','2023-05-22','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('70ae8751-489d-4c64-9197-a80e93498e6e','183bf829-76c2-44c7-8a20-b5c8b073efcb','379cb328-83b7-4519-898f-a143e0b90dec','2023-05-28','2023-07-01','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','bbb07118-4071-40b6-9b3f-e7a0079156df','2023-01-02','2024-02-07','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','53326e68-94a4-48c6-969d-084251735b35','2024-04-03','2023-09-12','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('a55211af-ebef-4ac7-bac9-be25c2ea3820','dd588b33-76f9-4032-a754-6aa34e26de7b','0f490e4b-5ade-41d0-80e7-0b194c8632d3','2024-02-08','2023-02-02','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('5b8856d8-f1b2-4cd9-baf5-46c37a6130ed','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','c5bd26c7-9fb5-448e-94ac-ad4cccb2ba86','2023-03-12','2023-11-17','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('6a388309-2818-4170-8909-3167eb82df1e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','f9ffb94e-4c4b-4398-a5f6-fee19f2af151','2023-10-27','2023-07-29','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('546101da-27f9-4d36-849a-2ff3665800ea','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','c78dbac2-3d83-4af9-81ce-6f772a8a321d','2023-07-11','2023-01-12','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('d66b2d2c-023c-48df-b3e3-4f79841d10aa','dd588b33-76f9-4032-a754-6aa34e26de7b','351f752a-02dc-45d7-85eb-44867e96655b','2023-08-26','2023-03-08','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('5dcad327-7a64-450e-89fd-d6047499d84a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','97329485-2c10-41c9-a5bd-395a747b8844','2023-06-25','2023-02-20','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('fa99041b-810d-4486-9689-ef904e7e56a3','2b94d71e-6311-4069-944f-d90c3206dc40','cb332795-288a-4f98-9317-2759d9c6a886','2024-02-10','2023-10-07','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('85041be6-cf8d-4194-8aaf-72ef4122002a','183bf829-76c2-44c7-8a20-b5c8b073efcb','a9acc1fe-480d-4a8c-8cac-2c0c7336a2f1','2024-06-24','2023-03-28','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('3c67c06e-5feb-43c7-97bc-29754e602ec8','679d63bc-b896-480b-be7f-c48780872ba6','06937e0f-084e-4687-9a30-f29b7eac5a6c','2023-06-18','2023-02-23','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('b6befe13-ba16-4736-bc45-db0b26e77c48','dd588b33-76f9-4032-a754-6aa34e26de7b','857e9465-6f6f-41fd-9a15-483834743f72','2023-12-24','2023-04-17','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('c2152a68-b0a0-45ac-88a8-ceea7947948e','dd588b33-76f9-4032-a754-6aa34e26de7b','cdeafef8-5283-482c-b8f7-33dcf23546d0','2024-04-12','2023-04-01','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('89e7214a-055d-45d6-ad43-cc091da33ca2','183bf829-76c2-44c7-8a20-b5c8b073efcb','de9a14f7-20e7-45e8-aeee-a34ffd3cf4d6','2023-03-11','2024-04-19','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('546101da-27f9-4d36-849a-2ff3665800ea','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','d494b95a-32f4-4884-87b5-a7d6f5ff769e','2023-04-05','2024-07-07','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('85041be6-cf8d-4194-8aaf-72ef4122002a','183bf829-76c2-44c7-8a20-b5c8b073efcb','9cf133c8-88b9-4e33-93c1-caee960e6b5b','2024-02-13','2024-05-07','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('993ff139-1fb7-4da7-98e0-62eff86a96e7','183bf829-76c2-44c7-8a20-b5c8b073efcb','1e558287-01c1-4991-9d1c-32bb00db6a55','2023-02-09','2023-08-26','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('7961610a-693c-4533-95e8-692a7cf56885','183bf829-76c2-44c7-8a20-b5c8b073efcb','097b4050-bb21-41a9-944d-78f3bba017af','2024-02-07','2024-02-09','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('54078046-db8b-4c5a-80e2-e51057fe8d8e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','ffa302a3-4e3d-4dbb-8751-961716fcceed','2023-07-13','2023-08-09','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('50da1ec7-c569-41b9-abac-1559cb7ac89c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','b256f02e-f372-4739-97ef-78f5c6e8c70a','2023-12-03','2023-05-04','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('5ab65223-ff3e-4d46-b3b4-2ecb9e68add9','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','626353a4-f46b-4de5-bcfc-e329c2e9734e','2023-04-26','2023-10-12','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('6a388309-2818-4170-8909-3167eb82df1e','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','581af360-b625-4e81-83a2-38983caeeae8','2024-02-10','2023-08-26','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('b9c36c7f-dd96-44f8-88f8-ffdf6be81344','dd588b33-76f9-4032-a754-6aa34e26de7b','0f7a5b9b-eb0a-45c1-a3d6-5f4fb0d896b1','2023-01-25','2023-08-11','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('b06251b8-a11b-4e92-8c79-2f57cacd59ec','dd588b33-76f9-4032-a754-6aa34e26de7b','8d4ab9aa-11b3-4acb-9637-9cbf75ed7340','2024-03-27','2024-02-01','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('a55211af-ebef-4ac7-bac9-be25c2ea3820','dd588b33-76f9-4032-a754-6aa34e26de7b','b88116cf-f437-464e-bfee-6bb79490b181','2024-05-25','2023-04-16','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('993ff139-1fb7-4da7-98e0-62eff86a96e7','183bf829-76c2-44c7-8a20-b5c8b073efcb','a365307a-7a70-414c-91c4-78686355daa8','2023-05-20','2024-05-16','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('fd1c3dfc-c0e6-4cc2-bab7-c67e026bb939','2b94d71e-6311-4069-944f-d90c3206dc40','41e47f72-651b-48d8-a916-e1484f48b8c1','2023-10-28','2024-04-08','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('5a8223b4-ca9f-4698-ac36-bdc6d3f0bc66','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','c127635a-c7ff-4cc8-878d-24f44bf545e1','2023-10-01','2023-05-22','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('adcd90cd-e764-4fe8-8c26-9e0aa21cb017','dd588b33-76f9-4032-a754-6aa34e26de7b','9aca565c-3056-4284-a99a-1edd035ce136','2023-01-15','2023-04-12','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('5dc072a6-d336-46a9-803f-3ecc4e5fdcaf','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','56e55b3e-0a95-444e-b663-fd15001511cf','2023-03-03','2023-02-13','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('5a8223b4-ca9f-4698-ac36-bdc6d3f0bc66','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','58263713-c0ef-4022-8ce9-712254b2df74','2023-05-22','2024-06-21','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('c83a56d6-c676-43dc-a858-d3aa801bbf61','dd588b33-76f9-4032-a754-6aa34e26de7b','98d514ed-64cc-4e74-a51b-6c6ece7a8810','2024-07-04','2023-09-02','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('a2db8651-cf91-4310-a717-1ebb8074950f','183bf829-76c2-44c7-8a20-b5c8b073efcb','1d1d0586-91f3-41dc-af96-033e76d4bb6d','2024-07-06','2023-04-08','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','e01b11f4-ff19-4487-8e5c-f7c89ce7d0b4','2023-04-05','2023-01-07','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('1c797c78-d1ee-4156-9138-78901e588bf0','679d63bc-b896-480b-be7f-c48780872ba6','8b1e7146-fd5b-4fee-a394-568b390c913f','2023-08-01','2023-01-09','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('348a9a95-f1a3-412d-9824-894cd77f1e3a','679d63bc-b896-480b-be7f-c48780872ba6','52ea16bc-dcf9-4cc2-bb35-5e476f58b907','2023-06-29','2023-04-07','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('f4684124-04b3-4762-a272-8530f3d7c8a1','2b94d71e-6311-4069-944f-d90c3206dc40','275b5c9c-b3e9-4b24-ba06-b6b07dede959','2024-05-14','2023-04-02','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('5d4f5cc4-f636-496a-953b-975485db9258','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','fc63f359-9f49-4f9e-8014-80ac809a90c9','2023-05-05','2024-04-26','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('fbaddd3a-4116-40ea-a8ac-52aab1849697','2b94d71e-6311-4069-944f-d90c3206dc40','21642b36-d933-4a6b-9530-97713765493f','2023-02-12','2023-02-17','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('f4684124-04b3-4762-a272-8530f3d7c8a1','2b94d71e-6311-4069-944f-d90c3206dc40','48d55e1b-f028-4d0c-8735-731d16b7e39b','2023-11-10','2023-10-25','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('d772aa6a-990c-4a23-83b8-5fb43148df36','dd588b33-76f9-4032-a754-6aa34e26de7b','8369ebf5-dbaf-4223-be8d-8b3b07d16373','2024-04-29','2024-05-29','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('1d5fdf23-e6a3-4e86-a740-22ad79eb67b9','679d63bc-b896-480b-be7f-c48780872ba6','51ddef10-887d-4991-8cc3-5b18bd9299b4','2023-04-24','2023-02-18','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('fac87498-7b32-48e5-842d-8f6e8a753b0e','2b94d71e-6311-4069-944f-d90c3206dc40','dfc75f06-01c8-4b27-b85f-8388f3dd5d98','2023-03-11','2024-01-18','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('e56e4383-5fed-4155-9a42-5d722b60e90d','2b94d71e-6311-4069-944f-d90c3206dc40','3b734a32-ce98-4596-8993-5cf4f52c7657','2024-06-07','2023-07-31','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('5ab65223-ff3e-4d46-b3b4-2ecb9e68add9','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','6bff7f20-df90-4d2f-bb6c-374482a1020e','2024-01-05','2023-06-04','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('f3870de4-1893-4518-8007-4892dc227872','2b94d71e-6311-4069-944f-d90c3206dc40','efc958bc-1908-4ec4-bdd5-676a40394dbb','2023-01-12','2023-08-31','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('52b1a258-b7ab-49d3-a7e5-af564a3cd20a','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','9d421b7a-dc01-4f9b-a4a1-455e1036fa7e','2023-12-18','2023-05-24','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('4afd9e20-2e32-47de-a59b-a485fa333b0b','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','22eff103-8aab-4ec3-8796-4b5b8e94e125','2023-07-19','2024-02-19','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('77b23c41-48c9-4493-bbf2-40db442cb444','183bf829-76c2-44c7-8a20-b5c8b073efcb','0c98df54-d138-40d4-bc80-dbf94630d9fa','2023-06-26','2024-04-05','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('f8a48090-57fc-4dc0-a435-54fb78a304eb','2b94d71e-6311-4069-944f-d90c3206dc40','4fcaa594-74df-4119-8695-3b61b29c9f2d','2023-05-26','2024-04-21','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('d772aa6a-990c-4a23-83b8-5fb43148df36','dd588b33-76f9-4032-a754-6aa34e26de7b','160b31d7-bc0b-4905-b748-f053555af8e6','2023-07-03','2024-05-22','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('6534cb41-6517-4ef9-a84c-5685ee6f719d','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','d5a65b82-8351-44c3-b797-2dd64c28dcfa','2024-04-07','2023-09-01','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('f3870de4-1893-4518-8007-4892dc227872','2b94d71e-6311-4069-944f-d90c3206dc40','5b784c57-e569-4439-ad3b-a025fee3ff08','2023-07-03','2023-01-22','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('4e4f2a4b-0697-4ef6-ad53-1094c1c181b6','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','f74cc6c0-be49-455c-8b55-3c287b008434','2024-04-14','2024-03-05','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('a47212ba-9472-4921-95a3-55adb48b6ada','dd588b33-76f9-4032-a754-6aa34e26de7b','ad34b33a-bf4e-42b4-bc64-ffc173566f15','2023-06-11','2023-08-12','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('c2152a68-b0a0-45ac-88a8-ceea7947948e','dd588b33-76f9-4032-a754-6aa34e26de7b','30531f00-55c7-4f6b-8a37-4076ec155d5a','2023-03-31','2023-10-13','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('fa99041b-810d-4486-9689-ef904e7e56a3','2b94d71e-6311-4069-944f-d90c3206dc40','3b1a9b74-f62f-48e7-94d1-c8600360a6a5','2023-12-06','2023-07-30','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('1c797c78-d1ee-4156-9138-78901e588bf0','679d63bc-b896-480b-be7f-c48780872ba6','381efcc0-775d-4622-80ce-d726ad83e9a6','2024-06-18','2023-04-29','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('d772aa6a-990c-4a23-83b8-5fb43148df36','dd588b33-76f9-4032-a754-6aa34e26de7b','153dd983-d1bd-43cc-a8f0-9f5641dfa211','2024-06-12','2023-05-17','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('f8b3eac7-fd48-4d8d-abf9-87eb94f7ed98','2b94d71e-6311-4069-944f-d90c3206dc40','2620ac34-7b2f-4591-9779-dc98f28d6f68','2023-05-14','2023-05-10','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('993ff139-1fb7-4da7-98e0-62eff86a96e7','183bf829-76c2-44c7-8a20-b5c8b073efcb','99f2c0ff-e56f-400d-b542-2a3c6b13e15b','2024-03-31','2023-06-13','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('3c67c06e-5feb-43c7-97bc-29754e602ec8','679d63bc-b896-480b-be7f-c48780872ba6','4a9c0a60-08cc-4c43-ba7c-bb44f8d0cc3b','2023-07-12','2023-01-06','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('da1909ce-a694-43d8-9a4d-b9e2e825269c','2b94d71e-6311-4069-944f-d90c3206dc40','b3101b4a-e18c-4d48-90b3-d0f473613b3f','2024-06-12','2024-04-04','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('79b97c21-87e5-49e5-80a6-0ff60e1a40d4','183bf829-76c2-44c7-8a20-b5c8b073efcb','3da11336-844e-43ea-8458-fec18c84dd3a','2023-05-09','2023-12-12','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('a2db8651-cf91-4310-a717-1ebb8074950f','183bf829-76c2-44c7-8a20-b5c8b073efcb','7ca21c96-e2f0-4e92-8ca9-7ed26eaf328a','2023-03-06','2023-08-18','{"name": "Monthly Membership", "source": "WEBPORTAL"}');
INSERT INTO fct_membership_purchases (user_id,branch_id,membership_id,membership_purchased_at,created_at,credit_pack_purchase_details) VALUES
     ('89e7214a-055d-45d6-ad43-cc091da33ca2','183bf829-76c2-44c7-8a20-b5c8b073efcb','82f42de8-e66d-45e0-84da-975b755ceda4','2023-09-04','2024-07-08','{"name": "Monthly Membership", "source": "WEBPORTAL"}'),
     ('5b8856d8-f1b2-4cd9-baf5-46c37a6130ed','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','b74a4b74-8d81-424b-b4ce-aadaaed7b9b8','2023-04-11','2024-07-09','{"name": "Yearly Membership", "source": "WEBPORTAL"}'),
     ('9010107a-a1b5-4f7f-b9cb-4b0eafe25098','183bf829-76c2-44c7-8a20-b5c8b073efcb','d446abba-06b1-4267-8749-673eb0836b56','2024-02-22','2023-07-25','{"name": "Weekly Membership", "source": "WEBPORTAL"}'),
     ('fac87498-7b32-48e5-842d-8f6e8a753b0e','2b94d71e-6311-4069-944f-d90c3206dc40','ff27fa71-933a-4bcd-b454-f2f5fede8dd2','2024-06-27','2023-12-18','{"name": "Monthly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('50da1ec7-c569-41b9-abac-1559cb7ac89c','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','929a3509-b033-4ee3-aa29-bd2e727ab0ab','2024-04-17','2024-06-29','{"name": "Yearly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('1c797c78-d1ee-4156-9138-78901e588bf0','679d63bc-b896-480b-be7f-c48780872ba6','183c17e9-1c75-4eb6-9ac7-1662532441a3','2023-11-19','2023-11-04','{"name": "Weekly Membership", "source": "RECEPTION_SIGNUP"}'),
     ('a3a9ee53-9c57-42e3-8d4f-147e4881dce7','dd588b33-76f9-4032-a754-6aa34e26de7b','54ab7094-2345-4375-b88a-dc08c124698e','2024-06-08','2023-05-11','{"name": "Monthly Membership", "source": "REFERRAL"}'),
     ('5b8856d8-f1b2-4cd9-baf5-46c37a6130ed','3591aa99-6a08-4bbc-8ecd-3dd79cb0bc74','b7e083cd-4440-47a4-9a15-b523e5385bf5','2024-04-26','2023-09-17','{"name": "Yearly Membership", "source": "REFERRAL"}'),
     ('d772aa6a-990c-4a23-83b8-5fb43148df36','dd588b33-76f9-4032-a754-6aa34e26de7b','19d8c70e-eb77-4a95-8c32-c01df1b7abde','2024-05-24','2024-03-31','{"name": "Weekly Membership", "source": "REFERRAL"}'),
     ('82cd1bb4-f8cf-49fd-8cac-104fc0cbb024','183bf829-76c2-44c7-8a20-b5c8b073efcb','25effbf1-c562-4d46-b940-43b9a4f09a3f','2023-02-07','2023-12-30','{"name": "Monthly Membership", "source": "WEBPORTAL"}');

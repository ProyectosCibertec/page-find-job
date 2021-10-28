-- borra la bd si existe
DROP DATABASE IF EXISTS pageFindJob;
-- creamos la bd
CREATE DATABASE pageFindJob;
-- activamos la bd
USE pageFindJob;

CREATE TABLE usuario (
	id					INT 			NOT NULL PRIMARY KEY AUTO_INCREMENT,
    password			VARCHAR(50)		NOT NULL,
    email				VARCHAR(50)		NOT NULL,
    active				INT				NOT NULL,
    super_user			INT				NULL DEFAULT 0,
    creation_date		DATETIME		NOT NULL,
    update_date			DATETIME		NULL,
    empresa				INT				NOT NULL
);


CREATE TABLE languages(
    id					INT				NOT NULL	PRIMARY KEY AUTO_INCREMENT,
    name 				VARCHAR(50)		NOT NULL
);
CREATE TABLE offer (
    id 					INT				NOT NULL	PRIMARY KEY	AUTO_INCREMENT,
    title				VARCHAR(50)		NOT NULL,
    description 		VARCHAR(2500)	NOT NULL,
    limit_date 			DATE 			NULL,
    create_date 		DATE			NOT NULL,
    update_date			DATE			NULL,
    vacants 			INT				NULL
);

CREATE TABLE offer_languages(
	id 					INT				NOT NULL	PRIMARY KEY	AUTO_INCREMENT,
    id_offer 			INT				NOT NULL,
    id_language 		INT				NOT NULL,
    FOREIGN KEY (id_language) REFERENCES languages(id),
    FOREIGN KEY (id_offer) REFERENCES offer(id)
);

ALTER TABLE usuario AUTO_INCREMENT = 1000;
ALTER TABLE offer AUTO_INCREMENT = 1000;
ALTER TABLE offer_languages AUTO_INCREMENT = 100;

-- inserts

DELIMiTER $$
CREATE PROCEDURE usp_add_language (v_name varchar(50))
BEGIN
	 INSERT INTO languages(name) VALUES(v_name);
END$$
DELIMiTER ;

DELIMiTER $$
CREATE PROCEDURE usp_add_offer (
	v_title VARCHAR(50),
    v_description VARCHAR(2500),
    v_limit_date DATE,
    v_create_date DATE,
    v_vacants INT
)
BEGIN
	 INSERT INTO offer(title,description,limit_date,create_date,vacants) VALUES(v_title, v_description, v_limit_date, v_create_date, v_vacants);
END$$
DELIMiTER;

DELIMiTER $$
CREATE PROCEDURE usp_add_offer_language(v_id_offer int, v_id_lang int)
BEGIN
	 INSERT INTO offer_languages(id_offer, id_language) VALUES(v_id_offer,v_id_lang);
END$$
DELIMiTER ;

DELIMiTER $$
CREATE PROCEDURE usp_get_user(v_email VARCHAR(50), v_password VARCHAR(50))
BEGIN
	 SELECT * FROM usuario WHERE email = v_email AND password = v_password;
END$$
DELIMiTER ;


-- insert USERS


INSERT INTO usuario VALUES(default, 1234,'demo@demo.com',1,0,'2010-09-15 17:14:12', null,0);
INSERT INTO usuario VALUES(default, 1234,'demo2@demo.com',1,0,'2010-09-15 17:14:12', null,0);
INSERT INTO usuario VALUES(default, 1234,'demo3@demo.com',1,0,'2010-09-15 17:14:12', null,0);

-- inserts LANGUAGES

call usp_add_language('JAVA');
call usp_add_language('Lenguaje de programación C');
call usp_add_language('Python');
call usp_add_language('C++');
call usp_add_language('C# ');
call usp_add_language('Visual Basic. NET');
call usp_add_language('SQL');
call usp_add_language('PHP');
call usp_add_language('Ruby');
call usp_add_language('Lenguaje de programación R');
call usp_add_language('Rust');
call usp_add_language('TypeScript');
call usp_add_language('Swift');
call usp_add_language('Perl');
call usp_add_language('Lenguaje de programación Go');
call usp_add_language('Kotlin');
call usp_add_language('Scheme');
call usp_add_language('Erlang');
call usp_add_language('Elixir');
call usp_add_language('Pascal');
call usp_add_language('Postscript');
call usp_add_language('Haskell');
call usp_add_language('Objective-C');
call usp_add_language('Scala');
call usp_add_language('Lava');

-- inserts OFFERS

call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/04/01','2021/10/01',0);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/01','2021/10/01',1);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/02','2021/10/02',2);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/03','2021/10/03',3);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/04','2021/10/04',4);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/05','2021/10/05',5);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/06','2021/10/06',6);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/07','2021/10/07',7);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/08','2021/10/08',8);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/09','2021/10/09',9);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/10','2021/10/10',10);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/11','2021/10/11',11);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/12','2021/10/12',12);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/13','2021/10/13',13);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/14','2021/10/14',14);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/15','2021/10/15',15);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/16','2021/10/16',16);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/17','2021/10/17',17);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/18','2021/10/18',18);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/19','2021/10/19',19);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead, empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely on projects that meet your career ambitions, and expand your impact through networking events, volunteering, publishing, public speaking opportunities, and more.
That’s why the world’s top 3% of designers choose Toptal. Designers in our elite network share:
English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta feature to avoid spam applicants.','2022/05/20','2021/10/20',20);

-- inserts offer_languages

call usp_add_offer_language(1001,6);
call usp_add_offer_language(1009,14);
call usp_add_offer_language(1004,18);
call usp_add_offer_language(1014,13);
call usp_add_offer_language(1009,22);
call usp_add_offer_language(1007,12);
call usp_add_offer_language(1017,18);
call usp_add_offer_language(1002,5);
call usp_add_offer_language(1011,23);
call usp_add_offer_language(1002,19);
call usp_add_offer_language(1003,20);
call usp_add_offer_language(1008,23);
call usp_add_offer_language(1002,5);
call usp_add_offer_language(1005,11);
call usp_add_offer_language(1004,10);
call usp_add_offer_language(1001,23);
call usp_add_offer_language(1009,13);
call usp_add_offer_language(1004,10);
call usp_add_offer_language(1000,13);
call usp_add_offer_language(1014,6);
call usp_add_offer_language(1001,21);
call usp_add_offer_language(1013,1);
call usp_add_offer_language(1017,23);
call usp_add_offer_language(1011,8);
call usp_add_offer_language(1010,22);
call usp_add_offer_language(1005,5);
call usp_add_offer_language(1020,12);
call usp_add_offer_language(1002,15);
call usp_add_offer_language(1009,13);
call usp_add_offer_language(1017,22);
call usp_add_offer_language(1007,9);
call usp_add_offer_language(1010,13);
call usp_add_offer_language(1017,3);
call usp_add_offer_language(1015,13);
call usp_add_offer_language(1006,4);
call usp_add_offer_language(1002,4);
call usp_add_offer_language(1019,3);
call usp_add_offer_language(1010,3);
call usp_add_offer_language(1018,4);
call usp_add_offer_language(1004,13);
call usp_add_offer_language(1004,24);
call usp_add_offer_language(1002,1);
call usp_add_offer_language(1005,19);
call usp_add_offer_language(1000,19);
call usp_add_offer_language(1006,16);
call usp_add_offer_language(1006,6);
call usp_add_offer_language(1002,19);
call usp_add_offer_language(1018,20);
call usp_add_offer_language(1010,23);
call usp_add_offer_language(1008,21);
call usp_add_offer_language(1010,19);
call usp_add_offer_language(1015,14);
call usp_add_offer_language(1009,12);
call usp_add_offer_language(1017,14);
call usp_add_offer_language(1001,4);
call usp_add_offer_language(1011,18);
call usp_add_offer_language(1001,7);
call usp_add_offer_language(1019,3);
call usp_add_offer_language(1014,1);
call usp_add_offer_language(1013,14);
call usp_add_offer_language(1004,2);
call usp_add_offer_language(1010,8);
call usp_add_offer_language(1001,16);
call usp_add_offer_language(1003,23);
call usp_add_offer_language(1013,8);
call usp_add_offer_language(1005,23);
call usp_add_offer_language(1006,3);
call usp_add_offer_language(1006,1);
call usp_add_offer_language(1005,18);
call usp_add_offer_language(1013,18);
call usp_add_offer_language(1003,2);
call usp_add_offer_language(1011,15);
call usp_add_offer_language(1000,3);
call usp_add_offer_language(1016,22);
call usp_add_offer_language(1005,22);
call usp_add_offer_language(1009,7);
call usp_add_offer_language(1017,3);
call usp_add_offer_language(1001,10);
call usp_add_offer_language(1008,2);
call usp_add_offer_language(1012,14);
call usp_add_offer_language(1018,4);
call usp_add_offer_language(1000,23);
call usp_add_offer_language(1007,19);
call usp_add_offer_language(1012,14);
call usp_add_offer_language(1011,3);
call usp_add_offer_language(1016,23);
call usp_add_offer_language(1016,23);
call usp_add_offer_language(1004,5);
call usp_add_offer_language(1017,5);
call usp_add_offer_language(1019,1);
call usp_add_offer_language(1020,14);
call usp_add_offer_language(1011,3);
call usp_add_offer_language(1018,10);
call usp_add_offer_language(1013,24);
call usp_add_offer_language(1012,5);
call usp_add_offer_language(1006,17);
call usp_add_offer_language(1010,15);
call usp_add_offer_language(1020,9);
call usp_add_offer_language(1014,9);
call usp_add_offer_language(1018,5);
call usp_add_offer_language(1020,3);
call usp_add_offer_language(1017,10);
call usp_add_offer_language(1005,13);
call usp_add_offer_language(1002,4);
call usp_add_offer_language(1010,24);
call usp_add_offer_language(1020,17);
call usp_add_offer_language(1005,7);
call usp_add_offer_language(1011,5);
call usp_add_offer_language(1013,7);
call usp_add_offer_language(1016,13);
call usp_add_offer_language(1013,14);
call usp_add_offer_language(1008,21);
call usp_add_offer_language(1020,12);
call usp_add_offer_language(1005,2);
call usp_add_offer_language(1014,7);
call usp_add_offer_language(1013,22);
call usp_add_offer_language(1017,1);
call usp_add_offer_language(1004,16);
call usp_add_offer_language(1019,23);
call usp_add_offer_language(1004,21);
call usp_add_offer_language(1014,21);

SELECT * FROM offer;
SELECT * FROM languages;


DELIMiTER $$
CREATE PROCEDURE usp_list_language_by_offer(v_offer_id INT)
BEGIN
	SELECT
		ol.id,
		l.name
	FROM offer_languages ol
	LEFT JOIN languages l
		ON ol.id_language = l.id
	WHERE id_offer = v_offer_id;
END$$
DELIMiTER ;

call usp_list_language_by_offer('1017');




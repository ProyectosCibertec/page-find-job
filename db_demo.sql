-- borra la bd si existe
DROP DATABASE IF EXISTS pageFindJob;
-- creamos la bd
CREATE DATABASE pageFindJob;
-- activamos la bd
USE pageFindJob;

create table languages(
    id int 		not null primary key AUTO_INCREMENT,
    name 		varchar(50)
);
create table offer (
    id int not null primary key AUTO_INCREMENT,
    title varchar(50) not null,
    description varchar(2500) not null,
    limit_date date null,
    create_date date not null,
    vacants int not null
);

create table offer_languages(
	id int not null primary key auto_increment,
    id_offer int not null,
    id_language int not null,
    FOREIGN KEY (id_language) REFERENCES languages(id),
    FOREIGN KEY (id_offer) REFERENCES offer(id)
);

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
CREATE PROCEDURE usp_add_offer (v_title varchar(50), v_description varchar(2500), v_limit_date date, v_create_date date, v_vacants int)
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
INSERT INTO offer_languages VALUES(DEFAULT,110,21);

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

SELECT * FROM offer;
SELECT * FROM languages;

call usp_add_offer_language(110,21);
call usp_add_offer_language('108','15');
call usp_add_offer_language('102','10');
call usp_add_offer_language('115','13');
call usp_add_offer_language('103','19');
call usp_add_offer_language('104','10');
call usp_add_offer_language('106','11');
call usp_add_offer_language('104','20');
call usp_add_offer_language('103','17');
call usp_add_offer_language('116','8');
call usp_add_offer_language('117','20');
call usp_add_offer_language('117','11');
call usp_add_offer_language('107','7');
call usp_add_offer_language('109','9');
call usp_add_offer_language('106','4');
call usp_add_offer_language('109','1');
call usp_add_offer_language('100','23');
call usp_add_offer_language('116','11');
call usp_add_offer_language('119','1');
call usp_add_offer_language('107','5');
call usp_add_offer_language('113','7');
call usp_add_offer_language('103','24');
call usp_add_offer_language('110','23');
call usp_add_offer_language('108','7');
call usp_add_offer_language('108','20');
call usp_add_offer_language('115','5');
call usp_add_offer_language('120','18');
call usp_add_offer_language('115','21');
call usp_add_offer_language('106','24');
call usp_add_offer_language('118','10');
call usp_add_offer_language('100','21');
call usp_add_offer_language('115','13');
call usp_add_offer_language('114','5');
call usp_add_offer_language('112','13');
call usp_add_offer_language('102','6');
call usp_add_offer_language('107','10');
call usp_add_offer_language('115','14');
call usp_add_offer_language('117','3');
call usp_add_offer_language('119','2');
call usp_add_offer_language('115','21');
call usp_add_offer_language('119','14');
call usp_add_offer_language('109','3');
call usp_add_offer_language('108','3');
call usp_add_offer_language('113','23');
call usp_add_offer_language('114','13');
call usp_add_offer_language('105','11');
call usp_add_offer_language('117','14');
call usp_add_offer_language('120','4');
call usp_add_offer_language('106','23');
call usp_add_offer_language('110','15');
call usp_add_offer_language('118','17');
call usp_add_offer_language('101','11');
call usp_add_offer_language('106','1');
call usp_add_offer_language('101','3');
call usp_add_offer_language('115','11');
call usp_add_offer_language('100','4');
call usp_add_offer_language('116','14');
call usp_add_offer_language('118','5');
call usp_add_offer_language('120','11');
call usp_add_offer_language('106','16');
call usp_add_offer_language('100','6');
call usp_add_offer_language('103','8');
call usp_add_offer_language('102','16');
call usp_add_offer_language('113','7');
call usp_add_offer_language('102','4');
call usp_add_offer_language('109','21');
call usp_add_offer_language('107','16');
call usp_add_offer_language('113','21');
call usp_add_offer_language('120','24');
call usp_add_offer_language('117','6');
call usp_add_offer_language('111','19');
call usp_add_offer_language('105','23');
call usp_add_offer_language('103','3');
call usp_add_offer_language('117','18');
call usp_add_offer_language('112','12');
call usp_add_offer_language('104','20');
call usp_add_offer_language('109','21');
call usp_add_offer_language('112','17');
call usp_add_offer_language('100','14');
call usp_add_offer_language('107','17');
call usp_add_offer_language('114','11');
call usp_add_offer_language('117','23');
call usp_add_offer_language('115','16');
call usp_add_offer_language('110','9');
call usp_add_offer_language('109','10');
call usp_add_offer_language('100','18');
call usp_add_offer_language('115','4');
call usp_add_offer_language('111','6');
call usp_add_offer_language('101','20');
call usp_add_offer_language('109','1');
call usp_add_offer_language('117','20');
call usp_add_offer_language('120','16');
call usp_add_offer_language('108','4');
call usp_add_offer_language('118','23');
call usp_add_offer_language('115','19');
call usp_add_offer_language('114','19');
call usp_add_offer_language('101','3');
call usp_add_offer_language('106','22');
call usp_add_offer_language('100','8');
call usp_add_offer_language('102','17');
call usp_add_offer_language('102','2');
call usp_add_offer_language('100','23');
call usp_add_offer_language('108','20');
call usp_add_offer_language('109','19');
call usp_add_offer_language('102','9');
call usp_add_offer_language('106','9');
call usp_add_offer_language('109','1');
call usp_add_offer_language('117','11');
call usp_add_offer_language('104','5');
call usp_add_offer_language('118','1');
call usp_add_offer_language('101','24');
call usp_add_offer_language('115','6');
call usp_add_offer_language('102','10');
call usp_add_offer_language('102','20');
call usp_add_offer_language('102','8');
call usp_add_offer_language('100','21');
call usp_add_offer_language('103','12');
call usp_add_offer_language('105','19');
call usp_add_offer_language('110','2');
call usp_add_offer_language('110','21');
call usp_add_offer_language('116','8');

SELECT * FROM offer;
SELECT * FROM languages;
SELECT * FROM offer_languages;

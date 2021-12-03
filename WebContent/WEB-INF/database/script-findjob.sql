-- borra la bd si existe
DROP DATABASE IF EXISTS pageFindJob;
-- creamos la bd
CREATE DATABASE pageFindJob;
-- activamos la bd
USE pageFindJob;

CREATE TABLE pais(
	id					INT 			NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name				VARCHAR(20)		NOT NULL
);

CREATE TABLE usuario (
	id					INT 			NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email				VARCHAR(50)		NOT NULL,
    password			VARCHAR(50)		NOT NULL,
    name				VARCHAR(25)		NOT NULL,
    lastname			VARCHAR(255)	NOT NULL,
    phone				CHAR(11)		NULL,
    birth_date			DATE			NULL,
    active				INT				NOT NULL,
    super_user			INT				NULL DEFAULT 0,
    empresa				INT				NOT NULL,
    address				VARCHAR(200)	NULL,
    pais_id				INT				NULL,
	creation_date		DATETIME		NOT NULL,
    update_date			DATETIME		NULL,
    FOREIGN KEY(pais_id)			REFERENCES	pais(id)
);


CREATE TABLE skills(
	id					INT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name				VARCHAR(100)	NOT NULL
);

CREATE TABLE user_skills(
	id					INT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario_id			INT				NOT NULL,
    skills_id			INT				NOT NULL,
    FOREIGN KEY(usuario_id)			REFERENCES usuario(id),
    FOREIGN KEY(skills_id)			REFERENCES skills(id)
);

CREATE TABLE redes (
	id					INT				NOT NULL 	PRIMARY KEY AUTO_INCREMENT,
    name				VARCHAR(100)	NOT NULL,
    description			VARCHAR(150)	NOT NULL
);

CREATE TABLE user_redes(
	id					INT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario_id			INT				NOT NULL,
    redes_id			INT				NOT NULL,
    FOREIGN KEY(usuario_id)			REFERENCES usuario(id),
    FOREIGN KEY(redes_id)			REFERENCES redes(id)
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

CREATE TABLE files(
	id					INT				NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario_id			INT				NOT NULL,
    file				BLOB 			NULL,
    title				VARCHAR(155)	NULL
);

CREATE TABLE postulant_offer(
	id					INT 		NOT NULL PRIMARY KEY	AUTO_INCREMENT,
    usuario_id			INT			NOT NULL,
    offer_id			INT			NOT NULL,
    FOREIGN KEY(usuario_id)		REFERENCES	usuario(id),
    FOREIGN KEY(offer_id)		REFERENCES	offer(id)
);


CREATE TABLE empresa_offer(
	id					INT 		NOT NULL PRIMARY KEY	AUTO_INCREMENT,
    usuario_id			INT			NOT NULL,
    offer_id			INT			NOT NULL,
    FOREIGN KEY(usuario_id)		REFERENCES	usuario(id),
    FOREIGN KEY(offer_id)		REFERENCES	offer(id)
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

-- insert PAIS

INSERT INTO pais VALUES(null, 'Perú');
INSERT INTO pais VALUES(null, 'Colombia');
INSERT INTO pais VALUES(null, 'Chile');
INSERT INTO pais VALUES(null, 'Argentina');
INSERT INTO pais VALUES(null, 'Ecuador');

-- insert USERS

INSERT INTO usuario VALUES(default,'demo@demo.com', 1234, 'Demo1', 'Lastname Demo', '987654321', '2010-09-15', 1, 0 ,0, 'Av siempre viva #1000','1','2010-09-15 17:14:12', null);
INSERT INTO usuario VALUES(default,'demo2@demo.com', 1234, 'Demo2', 'Lastname Demo', '987483339', '2010-09-15', 1, 0 ,0, 'Av los Girasoles #300','2','2010-09-15 17:14:12', null);
INSERT INTO usuario VALUES(default,'demo3@demo.com', 1234, 'Demo3', 'Lastname Demo', '999844483', '2010-09-15', 1, 0 ,0, 'Av los Tucanes #600','3','2010-09-15 17:14:12', null);

-- inset SKILLS

INSERT INTO skills VALUES(null, "Liderazgo");
INSERT INTO skills VALUES(null, "Flexibilidad");
INSERT INTO skills VALUES(null, "Adaptación");
INSERT INTO skills VALUES(null, "Capacidad resolutiva");
INSERT INTO skills VALUES(null, "Motivación");
INSERT INTO skills VALUES(null, "Confianza");
INSERT INTO skills VALUES(null, "Trabajo en equipo");
INSERT INTO skills VALUES(null, "PLanificación");
INSERT INTO skills VALUES(null, "Positivismo");
INSERT INTO skills VALUES(null, "Habilidades comunicativas");
INSERT INTO skills VALUES(null, "Mentoría");
INSERT INTO skills VALUES(null, "Gestión de programas");
INSERT INTO skills VALUES(null, "Motores de búsqueda");
INSERT INTO skills VALUES(null, "Ingeniería de datos");
INSERT INTO skills VALUES(null, "Pequeña empresa");
INSERT INTO skills VALUES(null, "Cumplimiento de pedidos");

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
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly
 with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with
 top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so
 you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead
 , empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely
 on projects that meet your career ambitions, and expand your impact through networking events, volunteering, 
 publishing, public speaking opportunities, and more.That’s why the world’s top 3% of designers choose Toptal.
Designers in our elite network share:English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta
 feature to avoid spam applicants.','2022/04/01','2021/10/01',1);
call usp_add_offer('Desarrolador/a Web - Prácticas Online','FUNCIONES : Descripción del empleo Requerimos colaboradores egresados o
 estudiantes de carreras técnicas o universitarias que tengan conocimientos intermedios de soporte 
 técnico de PCs y redes y programación. Serán expuestos 
 a una experiencia retadora en una empresa que les proporciona una magnífica experiencia por lo cual requerimos que
 sean muy dinámicos y se sientan capaces de lograr metas ambiciosas. FUNCIONES: Mantener y optimizar las páginas
 web y aplicaciones web de la empresa. Implementar y desarrollar nuevas soluciones web requeridas. Analizar 
 el funcionamiento de las páginas y aplicaciones web. Programar las modificaciones usando lenguaje de programación.
 Maquetar las interfaces de las páginas web.','2021/12/10','2021/10/01', 2);
call usp_add_offer('Desarrollador Full Stack Java/React','CSTI Corp es una empresa líder en la 
industria TI en Perú, especializado en brindar soluciones de negocios en las líneas de outsourcing,
 soporte y proyectos de innovación e integración utilizando SAP Cloud Platform, SAP Analytics Cloud
 y SAP Leonardo. Pertenecemos a la red global de "SAP Strategic Partner" para brindar servicios
 de consultoría en SAP Leonardo IoT con paquetes aceleradores y productos diseñados para ayudar
 a nuestros clientes a construir velozmente soluciones IoT específicos a las necesidades
 de sus negocios y a precios pre-definidos.','2022/05/02','2021/10/02',2);
call usp_add_offer('Practicante Desarrollador de Software',
'En belatec actualmente, nos encontramos en búsqueda de los mejores talentos para que ocupen el puesto de Practicante
 Desarrollador de Software para nuestra área de Tecnología Digital.

Requisitos:
- Estudiante de los últimos años de la carrera técnica y/o universitaria de Ingeniería o Desarrollo de software.

Funciones:
- Apoyo en el desarrollo de aplicaciones web acorde a los requerimientos de la empresa.
- Apoyo brindando soluciones de software que se adecúen a la infraestructura tecnológica.
Documentar programas o paquetes de software según los requerimientos y métodos de programación solicitados por la empresa.
- Apoyo en el mantenimiento de las plataformas locales a nivel de base de datos, funcionalidades de aplicaciones y programas informáticos.
- Apoyo en la implementación de las distintas plataformas y sistemas de gestión como parte de las herramientas informáticas.','2022/01/10','2021/10/03',3);
call usp_add_offer('Practicante Web Liferay','RESUMEN : everisan NTT DATA Company es
 una consultora multinacional que ofrece soluciones de negocio, estrategia, desarrollo y mantenimiento de 
 aplicaciones tecnológicas, y outsourcing. La compañía, que desarrolla su actividad en los sectores de telecomunicaciones
 , entidades financieras, industria, utilities, energía, administración pública y sanidad, alcanzó una facturación de 691
 millones de euros en el último ejercicio fiscal. En la actualidad, cuenta con más de 13.000 profesionales distribuidos
 en sus oficinas y centros de alto rendimiento en 14 países. La consultora pertenece al grupo NTT DATA, la sexta compañía
 de servicios IT del mundo, con 70.000 profesionales y presencia en Asia-Pacífico, Oriente Medio, Europa, Latinoamérica 
 y Norteamérica. La integración en NTT DATA permite aeverisampliar las soluciones y servicios para sus clientes, aumenta sus
 capacidades, recursos tecnológicos, geográficos y financieros le ayuda a dar las respuestas más innovadoras a sus clientes.
 ','2022/01/12','2021/10/04',4);
call usp_add_offer('Practicante de Desarrollador de Software','FUNCIONES
Desarrollar, implementar, y brindar mantenimiento y desarrollo de software.
Conocer y seguir las prácticas definidas en el equipo de trabajo.

PERFIL DEL CANDIDATO
Buscamos un estudiante de los últimos ciclos de Ingeniería de Sistemas, que cumpla lo siguiente:
- Manejo de LINUX.
- Tener iniciativa, imaginación y capacidad de toma de decisiones.

TE OFRECEMOS
- Mejorar tu conocimiento de desarrollo de software.
- Trabajar desde la comodidad de tu hogar.
- Capacitaciones técnicas sobre desarrollo y funcionales sobre diferentes tipos de negocio.
Requerimientos
- Educación mínima: Técnico
1 año de experiencia
Edad: entre 18 y 25 años
Disponibilidad de viajar: No
Disponibilidad de cambio de residencia: No','2022/05/05','2021/11/23',4);
call usp_add_offer('Practicante Profesional de Desarrollo de Software','RESUMEN :Somos una empresa de Soluciones
 Digitales y Servicios de TI con 30 años de experiencia en el mercado. Contamos con más de 8 mil colaboradores 
 en Latinoamérica, Estados Unidos y Europa. Te invitamos a ser parte de nuestro equipo ocupando el cargo de:
 Practicante Profesional.REQUISITOS: Estudios culminados en Ingeniería de Sistemas, Ingeniería de Software o
 similares.Experiencia de 6 meses en programación.Disponibilidad de aprendizaje.Manejo de habilidades blandas.BENEFICIOS:
 Pertenecer al grupo América Móvil.Practicas remuneradas.Seguro FOLA.Convenios corporativos.Línea de carrera.Modalidad
 de trabajo home office de momento, de lunes a viernes.',
 '2021/10/15','2021/12/15',6);
call usp_add_offer('Desarrollador(a) Cloud sin Experiencia/Junior','¿Te apasiona la programación y te gustaría trabajar
 para un partner de Microsoft?¡Esta oportunidad puede ser para ti! El Desarrollador(a) de Cloud es responsable
 de diseñar, crear, codificar y modificar sitios web y aplicaciones, así como de desarrollar e implementar
 un proceso donde se ejecuten todas las fases del ciclo de desarrollo del software, desde la arquitectura
 hasta la aplicación de las pruebas, asegurando que las aplicaciones cumplan con las especificaciones del
 cliente. El/la candidat ideal para este puesto es un/a profesional práctic que sea un/a apasionad por la
 tecnología y que esté a la vanguardia de las últimas tendencias en un entorno cambiante.Responsabilidades
 y Deberes Participar en todas las fases del desarrollo de la nube desde los requisitos, definición, diseño,
 desarrollo, despliegue y mantenimiento, hasta el ajuste y la supervisión del rendimiento, utilizando las
 mejores prácticas y asegurándose que el código esté libre de errores.Trabajar en equipo con arquitectos
 de soluciones en la nube, administradores de bases de datos en la nube, administradores de la nube y clientes,
 para implementar soluciones','2021/12/22','2021/10/07',2);
call usp_add_offer('Frontend and backend development','Requirements
Student of the last cycles of systems engineering university
Angular 10 Node JS

Profits
Salary according to the market.
Monthly and punctual payments.
Horizontal or vertical career line opportunity
Constant training
Online integration activities
We care about your health and that of your family, that is why we work remotely.
Opportunity to work with important international companies in the banking, telecommunications and retail sectors.
MDP believes in equal opportunities for women and men, therefore we promote the diversity of generations, origin,
 nationality and inclusion of people with different abilities and / or disabilities (in accordance with Law 29973)
At MDP Consulting, an important information technology consultancy with more than 10 years of experience in the 
field, certified in CMMI Level 3, TMMI Level 3 and ISO-9001 2008, we are in search of the best talents for our
 vacancy.','2022/03/01','2021/10/24',8);
call usp_add_offer('Practicante Pre Profesional','En Manpower Perú tenemos una gran oportunidad 
laboral para ti.
 FUNCIONES:- Apoyar en elaborar la documentación funcional y técnica de los sistemas.-
 Apoyar en la preparación de manuales de formación para usuarios.- Apoyar en desarrollar procesos Automáticos ETL en
 BD.- Apoyar en desarrollar procesos en Java Web Con Oracle. BENEFICIOS:- Pertenecer a la Planilla del Cliente.-
 Línea de carrera','2022/05/09','2021/10/09',1);
call usp_add_offer('Web Developer','Toptal is an exclusive network of top freelancers from around the world.
 Fortune 500 companies and Silicon Valley startups hire Toptal for their most important projects. Toptal is one of
 the fastest-growing fully remote networks and empowers freelance software developers, designers, finance experts,
 product managers, and project managers worldwide to grow and excel in their freelance careers.
Toptal clients vary in sizes and industries, from enterprise organizations and big tech companies to Silicon
 Valley startups and renowned universities. Once you enter the network, our matchers will contact
 you with project opportunities that fit your expertise and preferences. We have experts in over 120 countries
 who get to work remotely on projects that meet their career ambitions.','2021/12/29', '2021/10/10',10);
call usp_add_offer('Practicante Front End','Leading company in software development and technological
 solutions has several open positions for Peruvians for remote work with remuneration in US Dollars.',
 '2022/05/11','2021/10/11',11);
call usp_add_offer('Practicante Front End','If you are looking to learn in IT Management, this is your opportunity!
We are looking for talented and motivated students to fill the position of Computer Development Intern.

Among the challenges are:

Support in software development: frontend, backend, database.
Support in the creation of manuals and application prototypes.
Validate the operability of applications.
Provide support in the control of functional documentation.
Support the functional specification of applications.

All our processes respect equal opportunities, promote diversity and non-discrimination based on race,
 color, age, sex, sexual orientation, marital status, ideology, political opinions, nationality, religion,
 disability or any other personal, physical condition. or social. The ability to incorporate, motivate and 
 retain the best talent will be guaranteed, maintaining ethical and legal principles, aligned with our
 corporate values.','2022/05/12','2021/10/12',12);
call usp_add_offer('Practicante Front End','Tata Consultancy Services es una empresa de servicios de TI, consultoría
 y soluciones de negocios que se asocia con varias grandes empresas globales para acompañarlos en su trayectoria de
 transformación. TCS ofrece una cartera integrada enfocada en consultoría y basada en Cognitive de servicios TI,
 Servicios de Tecnología y Negocios, e ingeniería. Todo esto se ofrece por medio de su único modelo de entrega Ágil
 de ubicación independiente (Location Independent Agile), reconocido como el parámetro de excelencia en desarrollo
 de aplicaciones. Como parte del Grupo Tata, el conglomerado industrial más grande de la India, TCS posee más de 
 390,000 de los consultores mejor capacitados del mundo en 46 países.','2022/05/13','2021/10/13',13);
call usp_add_offer('Software Engineer Developer Junior','Ravn is a fast growing digital product development agency. 
We specialize in designing and developing mobile and web applications. We are looking for web and mobile engineers
 to lead and assist development projects for clients in the USA.','2022/05/14','2021/10/14',7);
call usp_add_offer('Practicante de desarrollo Aplicaciones Web/Movil','Para labores de desarrollo de aplicaciones, requerimos un desarrollador con experiencia previa y comprobable, en aplicaciones Web no menor a 1 año (indispensable). Conocimientos de Java es deseable.
Experiencia necesaria en el uso de Java. Capacidad de aprendizaje para nuevos frameworks. Deseable si conoce Flutter (opcional).
Profesional de nivel Universitario egresado o décimo ciclo de las carreras de ingeniería de sistemas, informática, ingeniería de software.
Se tomarán pruebas de conocimientos. El trabajo inicialmente se desarrollará en forma remota. Enviar c.v. indicando experiencia en trabajos anteriores en desarrollo de aplicaciones Web (necesario e imprescindible), disponibilidad y pretensiones económicas.
Se ofrece línea de carrera en función a evaluaciones.
No aplica como experiencia previa, labores en help desk, configuración de hardware, configuración de correo, soporte técnico presencial o a distancia y similares.
Si aplica como experiencia previa, desarrollo de aplicaciones transaccionales como contabilidad, inventarios, planillas, sistemas académicos.
Menor de 23 años (requerido)
Enviar referencias (nombre de persona, correo electrónico, celular) de prácticas o trabajos anteriores. Enviar CV a informes @proemsasoftware.com,
 adjuntando último record de notas, con el título: Practicante Desarrollo, solo si cumple con los requisitos','2022/05/15','2021/10/15',15);
call usp_add_offer('Practicante de Innovación TI','Descripción de la Empresa:
Somos Claro Perú, formamos parte del grupo América Móvil, líderes en servicios de Telecomunicaciones en América Latina. Contamos con un excelente conocimiento del sector, una sólida estructura, tecnología de primer nivel y gran equipo humano.

Descripción Funciones del Cargo:
Claro Perú, pertenecemos al grupo líder en servicios de telecomunicaciones en América Latina nos encontramos actualmente en búsqueda de un Practicante de Innovación TI, comprometido con mejorar la vida de los peruanos a través de las telecomunicaciones:

Apoyar en la validación las propuestas de implementación de nuevas aplicaciones e iniciativas referentes a temas de innovación tecnológica y cultural.
Coordinar con Proveedores y clientes (internos/externos) la atención de los requerimientos
Generar generar indicadores del área, indicadores de gestión de iniciativas, requerimientos en ejecución y situación de proyectos
Requisitos:
Estudiante de 8°, 9° y 10° ciclo de la carrera de Ing. Sistemas, Informática o afines
Conocimientos en SCRUM de scrum alliance o scrum.org (Deseable)
Desarrollo de Sistemas y Servicios Web en lenguaje Java (Deseable)','2022/05/16','2021/10/16',9);
call usp_add_offer('Practicante de Sistemas','REQUISITOS:
Universitarios o Técnicos recién egresado o estudiantes de últimos ciclos de Ingeniería de Sistemas o computación e informática.

Edad:
19 a 25 años

Sexo
Masculino o Femenino

PERSONALES
Persona proactiva
Guste trabajo en equipo
Autodidacta y que deseos de superación constante
Responsabilidad y Honestidad. Cumplimiento de metas y objetivos

FUNCIÓN GENERAL:
Apoyar en el desarrollo de soluciones de software alineadas con los objetivos de la empresa.
','2022/05/17','2021/10/17',1);
call usp_add_offer('Practicante Front End','Design your lifestyle with the freedom to work however, wherever — on your terms.
Freelance work is defining the careers of today’s designers in exciting new ways. If you’re passionate about working flexibly
 with leading Fortune 500 brands and innovative Silicon Valley startups, Toptal could be a great fit for your next career move.
Toptal is an elite talent network for the world’s top 3% of UI designers, connecting the best and brightest freelancers with
 top organizations. Unlike a 9-to-5 job, you’ll choose your own schedule and work from anywhere. Jobs come to you, so
 you won’t bid for projects against other designers in a race to the bottom. Plus, Toptal takes care of all the overhead
 , empowering you to focus on successful engagements while getting paid on time, at the rate you decide, every time.
As a freelance designer, you’ll instantly join a thriving community of experts in over 120 countries. Work remotely
 on projects that meet your career ambitions, and expand your impact through networking events, volunteering, 
 publishing, public speaking opportunities, and more.That’s why the world’s top 3% of designers choose Toptal.
Designers in our elite network share:English language proficiency
At least 3 years of professional experience as a UI designer
Project management skills
A keen attention to detail
If you’re ready for a career shift to impactful freelance work, take the next step in your career by filling out this
 short form: https://topt.al/xVc8Z7
Be sure to mention the words RALLY CLOWN CEREAL when applying to show you read the job post completely. This is a beta
 feature to avoid spam applicants.','2022/05/18','2021/10/18',1);
call usp_add_offer('Practicante Sistema de Facturación','Descripción de la Empresa:
Somos Claro Perú, formamos parte del grupo América Móvil, líderes en servicios de Telecomunicaciones en América Latina. Contamos con un excelente conocimiento del sector, una sólida estructura, tecnología de primer nivel y gran equipo humano.

Descripción Funciones del Cargo:
Validar las estimaciones y esfuerzos que las fábricas indiquen para la atención de los Requerimientos TI
Apoyar en los pases a Producción
Dar soporte a la ejecución de los procesos relacionados a desarrollo

Condiciones Oferta:Descripción Proceso de Selección:
El proceso de selección se realiza a través de AIRA - plataforma de reclutamiento diseñado para mejorar tu experiencia de postulación.',
'2022/05/19','2021/10/19',19);
call usp_add_offer('Ingeniero de Software Practicante','En Novatronic S.A.C., empresa peruana de TI líder con 
33 años en el mercado de desarrollo de sistemas transaccionales, de pago, de integración y seguridad; nos encontramos en 
la búsqueda de una persona proactiva, comprometida, con disposición de trabajo en equipo y que brinde importancia a la 
calidad de su trabajo para el cargo de Ingeniero de Software Practicante.

Funciones:
• Desarrollo e implementación de los productos de software, correspondiente a los proyectos y productos de la empresa.
• Documentación de los productos desarrollados.
• Apoyo en las pruebas de los productos desarrollados.
• Apoyo en el Análisis y diseño de Nuevos Productos.
• Las funciones se realizarán en la modalidad de trabajo remoto.','2022/05/20','2021/10/20',4);

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

call usp_list_language_by_offer(1044);

-- PROC QUE FILTRA LAS OFERTAS POR TITULO
DROP PROCEDURE usp_get_offer_by_title;
DELIMiTER $$
CREATE PROCEDURE usp_get_offer_by_title(chain VARCHAR(50))
BEGIN
	 SELECT * FROM offer WHERE title LIKE (CONCAT("%",chain,"%"));
END$$
DELIMiTER ;

DROP PROCEDURE usp_demo;
DELIMiTER $$
CREATE PROCEDURE usp_demo(chain VARCHAR(50))
BEGIN
	 SELECT * FROM offer;
END$$
DELIMiTER ;

call usp_get_offer_by_title("Desarro");

-- PROC PARA TRAER LAS OFERTAS POR LENGUAJES
DELIMiTER $$
CREATE PROCEDURE usp_demoo(p_chain VARCHAR(50))
BEGIN
	SET @wheres = CONCAT('SELECT * FROM offer_languages ol INNER JOIN languages l ON ol.id_language = l.id INNER JOIN offer o ON ol.id_offer = o.id  WHERE l.id IN (', p_chain, ')');
    PREPARE funca FROM  @wheres;
	EXECUTE funca;
	DEALLOCATE PREPARE funca;
END$$
DELIMiTER ;

call usp_demoo('1,2,3,4,5');

-- PROC QUE DEVUELVE LA ULTIMA OFERTA
DELIMiTER $$
CREATE PROCEDURE usp_get_last_offer()
BEGIN
	 SELECT * FROM offer ORDER BY id DESC LIMIT 1;
END$$
DELIMiTER ;

call usp_get_last_offer();

SELECT CONCAT('%', "Hola", '%');

CREATE TABLE `Programa` (
	`pro_id` bigint NOT NULL AUTO_INCREMENT,
	`pro_especialidad` bigint NOT NULL,
	`pro_centro` bigint NOT NULL,
	`pro_nombre` varchar(200) NOT NULL,
	`pro_codigo` numeric(7) NOT NULL,
	`pro_tipo` int NOT NULL,
	`pro_modalidad` int NOT NULL,
	`pro_jornada` int NOT NULL,
	`pro_ciudad` varchar(20) NOT NULL,
	`pro_descripcion` TEXT NOT NULL,
	`pro_version` numeric(3) NOT NULL,
	`pro_tiene_registro` bool NOT NULL,
	`pro_registro_calificado` varchar(20) NOT NULL,
	`pro_fecha_registro` DATE NOT NULL,
	`pro_fecha_vencimiento_registro` DATE NOT NULL,
	`pro_habilitado` smallint NOT NULL,
	`pro_imagenes` TEXT NOT NULL,
	`pro_iniciales` varchar(20) NOT NULL,
	PRIMARY KEY (`pro_id`)
);

CREATE TABLE `Usuario` (
	`usu_id` bigint NOT NULL AUTO_INCREMENT,
	`usu_email` varchar(20) NOT NULL,
	`usu_nombre` varchar(20) NOT NULL,
	`usu_password` varchar(20) NOT NULL,
	PRIMARY KEY (`usu_id`)
);

CREATE TABLE `Cargo` (
	`car_id` bigint NOT NULL AUTO_INCREMENT,
	`car_nombre` varchar(50) NOT NULL,
	`car_apellido` varchar(50) NOT NULL,
	`car_correo` varchar(50) NOT NULL,
	`car_profesion` varchar(50) NOT NULL,
	`car_tipo` varchar(50) NOT NULL,
	`car_foto` TEXT NOT NULL,
	PRIMARY KEY (`car_id`)
);

CREATE TABLE `Proyectos_exitosos` (
	`pe_id` bigint NOT NULL AUTO_INCREMENT,
	`pe_descripcion` TEXT NOT NULL,
	`pe_talento` varchar(50) NOT NULL,
	`pe_fecha` DATE NOT NULL,
	PRIMARY KEY (`pe_id`)
);

CREATE TABLE `Centro` (
	`cen_id` bigint NOT NULL AUTO_INCREMENT,
	`cen_reg` bigint NOT NULL,
	`cen_subdirector` bigint NOT NULL,
	`cen_nombre` varchar(100) NOT NULL,
	`cen_direccion` varchar(100) NOT NULL,
	`cen_telefono` varchar(100) NOT NULL,
	`cen_extension` varchar(100) NOT NULL,
	`cen_fax` varchar(100) NOT NULL,
	`cen_plan_estrategico` varchar(250) NOT NULL,
	`cen_regional` varchar(50) NOT NULL,
	PRIMARY KEY (`cen_id`)
);

CREATE TABLE `Noticias` (
	`not_id` bigint NOT NULL AUTO_INCREMENT,
	`not_programa` bigint NOT NULL,
	`not_nombre` varchar(20) NOT NULL,
	`not_descripcion` TEXT NOT NULL,
	`not_imagen` bigint NOT NULL,
	`not_fecha` DATE NOT NULL,
	`not_tipo` smallint NOT NULL,
	PRIMARY KEY (`not_id`)
);

CREATE TABLE `Especialidad` (
	`esp_id` bigint NOT NULL AUTO_INCREMENT,
	`esp_nombre` varchar(50) NOT NULL,
	PRIMARY KEY (`esp_id`)
);

CREATE TABLE `Tecnoparque` (
	`tec_id` bigint NOT NULL AUTO_INCREMENT,
	`tec_director` bigint NOT NULL,
	`tec_proyectos` bigint NOT NULL,
	`tec_empresa` bigint NOT NULL,
	`tec_lineas` int NOT NULL,
	PRIMARY KEY (`tec_id`)
);

CREATE TABLE `Empresas_aliadas` (
	`ea_id` bigint NOT NULL AUTO_INCREMENT,
	`ea_nombre` varchar(50) NOT NULL,
	`ea_sector` varchar(50) NOT NULL,
	`ea_proyecto` bigint NOT NULL,
	PRIMARY KEY (`ea_id`)
);

ALTER TABLE `Programa` ADD CONSTRAINT `Programa_fk0` FOREIGN KEY (`pro_especialidad`) REFERENCES `Especialidad`(`esp_id`);

ALTER TABLE `Programa` ADD CONSTRAINT `Programa_fk1` FOREIGN KEY (`pro_centro`) REFERENCES `Centro`(`cen_id`);

ALTER TABLE `Centro` ADD CONSTRAINT `Centro_fk0` FOREIGN KEY (`cen_subdirector`) REFERENCES `Cargo`(`car_id`);

ALTER TABLE `Noticias` ADD CONSTRAINT `Noticias_fk0` FOREIGN KEY (`not_programa`) REFERENCES `Programa`(`pro_id`);

ALTER TABLE `Tecnoparque` ADD CONSTRAINT `Tecnoparque_fk0` FOREIGN KEY (`tec_director`) REFERENCES `Cargo`(`car_id`);

ALTER TABLE `Tecnoparque` ADD CONSTRAINT `Tecnoparque_fk1` FOREIGN KEY (`tec_proyectos`) REFERENCES `Proyectos_exitosos`(`pe_id`);

ALTER TABLE `Tecnoparque` ADD CONSTRAINT `Tecnoparque_fk2` FOREIGN KEY (`tec_empresa`) REFERENCES `Empresas_aliadas`(`ea_id`);

ALTER TABLE `Empresas_aliadas` ADD CONSTRAINT `Empresas_aliadas_fk0` FOREIGN KEY (`ea_proyecto`) REFERENCES `Proyectos_exitosos`(`pe_id`);


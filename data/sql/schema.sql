CREATE TABLE aims (id BIGINT AUTO_INCREMENT, aim VARCHAR(255) NOT NULL, sigla VARCHAR(255) NOT NULL, presidente_id BIGINT, INDEX presidente_id_idx (presidente_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE aims_admin (id BIGINT AUTO_INCREMENT, aim_id BIGINT NOT NULL, user_id BIGINT NOT NULL, INDEX aim_id_idx (aim_id), INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE cfg_ciudades (id BIGINT AUTO_INCREMENT, provincia_id BIGINT NOT NULL, ciudad VARCHAR(255) NOT NULL, INDEX provincia_id_idx (provincia_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE cfg_dias (id BIGINT AUTO_INCREMENT, dia VARCHAR(255), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE cfg_paises (id BIGINT AUTO_INCREMENT, pais VARCHAR(255) NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE cfg_programas (id BIGINT AUTO_INCREMENT, programa VARCHAR(255), logo VARCHAR(255), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE cfg_provincias (id BIGINT AUTO_INCREMENT, pais_id BIGINT NOT NULL, provincia VARCHAR(255) NOT NULL, INDEX pais_id_idx (pais_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE clubes (id BIGINT AUTO_INCREMENT, club VARCHAR(255) NOT NULL, email VARCHAR(255), url VARCHAR(255), direccion VARCHAR(255), presidente_id BIGINT, ciudad_id BIGINT, distrito_id BIGINT NOT NULL, programa_id BIGINT NOT NULL, INDEX distrito_id_idx (distrito_id), INDEX ciudad_id_idx (ciudad_id), INDEX programa_id_idx (programa_id), INDEX presidente_id_idx (presidente_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE clubes_admin (id BIGINT AUTO_INCREMENT, club_id BIGINT NOT NULL, user_id BIGINT NOT NULL, INDEX club_id_idx (club_id), INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE clubes_reunion (id BIGINT AUTO_INCREMENT, club_id BIGINT NOT NULL, dia_id BIGINT NOT NULL, hora TIME NOT NULL, INDEX dia_id_idx (dia_id), INDEX club_id_idx (club_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE distritos (id BIGINT AUTO_INCREMENT, distrito BIGINT NOT NULL, gd_id BIGINT, rdr_id BIGINT, rdi_id BIGINT, aim_id BIGINT, INDEX aim_id_idx (aim_id), INDEX gd_id_idx (gd_id), INDEX rdr_id_idx (rdr_id), INDEX rdi_id_idx (rdi_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE distritos_admin (id BIGINT AUTO_INCREMENT, distrito_id BIGINT NOT NULL, user_id BIGINT NOT NULL, INDEX distrito_id_idx (distrito_id), INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_forgot_password (id BIGINT AUTO_INCREMENT, user_id BIGINT NOT NULL, unique_key VARCHAR(255), expires_at DATETIME NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group_permission (group_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(group_id, permission_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_permission (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_remember_key (id BIGINT AUTO_INCREMENT, user_id BIGINT, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user (id BIGINT AUTO_INCREMENT, first_name VARCHAR(255), last_name VARCHAR(255), email_address VARCHAR(255) NOT NULL UNIQUE, username VARCHAR(128) NOT NULL UNIQUE, algorithm VARCHAR(128) DEFAULT 'sha1' NOT NULL, salt VARCHAR(128), password VARCHAR(128), is_active TINYINT(1) DEFAULT '1', is_super_admin TINYINT(1) DEFAULT '0', last_login DATETIME, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX is_active_idx_idx (is_active), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_group (user_id BIGINT, group_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, group_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_permission (user_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, permission_id)) ENGINE = INNODB;
ALTER TABLE aims ADD CONSTRAINT aims_presidente_id_sf_guard_user_id FOREIGN KEY (presidente_id) REFERENCES sf_guard_user(id);
ALTER TABLE aims_admin ADD CONSTRAINT aims_admin_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id);
ALTER TABLE aims_admin ADD CONSTRAINT aims_admin_aim_id_aims_id FOREIGN KEY (aim_id) REFERENCES aims(id);
ALTER TABLE cfg_ciudades ADD CONSTRAINT cfg_ciudades_provincia_id_cfg_provincias_id FOREIGN KEY (provincia_id) REFERENCES cfg_provincias(id);
ALTER TABLE cfg_provincias ADD CONSTRAINT cfg_provincias_pais_id_cfg_paises_id FOREIGN KEY (pais_id) REFERENCES cfg_paises(id);
ALTER TABLE clubes ADD CONSTRAINT clubes_programa_id_cfg_programas_id FOREIGN KEY (programa_id) REFERENCES cfg_programas(id);
ALTER TABLE clubes ADD CONSTRAINT clubes_presidente_id_sf_guard_user_id FOREIGN KEY (presidente_id) REFERENCES sf_guard_user(id);
ALTER TABLE clubes ADD CONSTRAINT clubes_distrito_id_distritos_id FOREIGN KEY (distrito_id) REFERENCES distritos(id);
ALTER TABLE clubes ADD CONSTRAINT clubes_ciudad_id_cfg_ciudades_id FOREIGN KEY (ciudad_id) REFERENCES cfg_ciudades(id);
ALTER TABLE clubes_admin ADD CONSTRAINT clubes_admin_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id);
ALTER TABLE clubes_admin ADD CONSTRAINT clubes_admin_club_id_clubes_id FOREIGN KEY (club_id) REFERENCES clubes(id);
ALTER TABLE clubes_reunion ADD CONSTRAINT clubes_reunion_dia_id_cfg_dias_id FOREIGN KEY (dia_id) REFERENCES cfg_dias(id);
ALTER TABLE clubes_reunion ADD CONSTRAINT clubes_reunion_club_id_clubes_id FOREIGN KEY (club_id) REFERENCES clubes(id);
ALTER TABLE distritos ADD CONSTRAINT distritos_rdr_id_sf_guard_user_id FOREIGN KEY (rdr_id) REFERENCES sf_guard_user(id);
ALTER TABLE distritos ADD CONSTRAINT distritos_rdi_id_sf_guard_user_id FOREIGN KEY (rdi_id) REFERENCES sf_guard_user(id);
ALTER TABLE distritos ADD CONSTRAINT distritos_gd_id_sf_guard_user_id FOREIGN KEY (gd_id) REFERENCES sf_guard_user(id);
ALTER TABLE distritos ADD CONSTRAINT distritos_aim_id_aims_id FOREIGN KEY (aim_id) REFERENCES aims(id);
ALTER TABLE distritos_admin ADD CONSTRAINT distritos_admin_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id);
ALTER TABLE distritos_admin ADD CONSTRAINT distritos_admin_distrito_id_distritos_id FOREIGN KEY (distrito_id) REFERENCES distritos(id);
ALTER TABLE sf_guard_forgot_password ADD CONSTRAINT sf_guard_forgot_password_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_remember_key ADD CONSTRAINT sf_guard_remember_key_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;

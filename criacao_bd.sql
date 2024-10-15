-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'ProdutorRural'
-- 
-- ---

DROP TABLE IF EXISTS `ProdutorRural`;
		
CREATE TABLE `ProdutorRural` (
  `id_produtor` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome_produtor` VARCHAR(100) NOT NULL,
  `localizacao_fazenda` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_produtor`)
);

-- ---
-- Table 'Plantacao'
-- 
-- ---

DROP TABLE IF EXISTS `Plantacao`;
		
CREATE TABLE `Plantacao` (
  `id_plantacao` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_produtor` INTEGER NOT NULL,
  `tipo_cultura` VARCHAR(50) NOT NULL,
  `area_plantada` INTEGER NOT NULL,
  `data_plantio` DATETIME NOT NULL,
  PRIMARY KEY (`id_plantacao`)
);

-- ---
-- Table 'Sensor'
-- 
-- ---

DROP TABLE IF EXISTS `Sensor`;
		
CREATE TABLE `Sensor` (
  `id_sensor` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_plantacao` INTEGER NOT NULL,
  `tipo_sensor` VARCHAR(50) NOT NULL,
  `localizacao_sensor` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_sensor`)
);

-- ---
-- Table 'LeituraSensor'
-- 
-- ---

DROP TABLE IF EXISTS `LeituraSensor`;
		
CREATE TABLE `LeituraSensor` (
  `id_leitura` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_sensor` INTEGER NOT NULL,
  `data_hora_leitura` DATETIME NOT NULL,
  `valor_leitura` INTEGER NOT NULL,
  PRIMARY KEY (`id_leitura`)
);

-- ---
-- Table 'AplicacaoIrrigacaoNutrientes'
-- 
-- ---

DROP TABLE IF EXISTS `AplicacaoIrrigacaoNutrientes`;
		
CREATE TABLE `AplicacaoIrrigacaoNutrientes` (
  `id_aplicacao` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_plantacao` INTEGER NOT NULL,
  `data_hora_aplicacao` DATETIME NOT NULL,
  `quantidade_agua` INTEGER NOT NULL,
  `quantidade_nutrientes` INTEGER NOT NULL,
  PRIMARY KEY (`id_aplicacao`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Plantacao` ADD FOREIGN KEY (id_produtor) REFERENCES `ProdutorRural` (`id_produtor`);
ALTER TABLE `Sensor` ADD FOREIGN KEY (id_plantacao) REFERENCES `Plantacao` (`id_plantacao`);
ALTER TABLE `LeituraSensor` ADD FOREIGN KEY (id_sensor) REFERENCES `Sensor` (`id_sensor`);
ALTER TABLE `AplicacaoIrrigacaoNutrientes` ADD FOREIGN KEY (id_plantacao) REFERENCES `Plantacao` (`id_plantacao`);
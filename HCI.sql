/*
 Navicat MySQL Data Transfer

 Source Server         : DevWeb
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : maisonbleue2020.ddns.net:3306
 Source Schema         : luis_webdev

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 20/06/2022 01:19:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Conductor
-- ----------------------------
DROP TABLE IF EXISTS `Conductor`;
CREATE TABLE `Conductor`  (
  `idConductor` int NOT NULL AUTO_INCREMENT,
  `telefono` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `numeroLicencia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idConductor`) USING BTREE,
  INDEX `FK_es un_Usuario`(`idUsuario` ASC) USING BTREE,
  CONSTRAINT `FK_es un_Usuario` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ConductorReporte
-- ----------------------------
DROP TABLE IF EXISTS `ConductorReporte`;
CREATE TABLE `ConductorReporte`  (
  `idReporteSiniestro` int NULL DEFAULT NULL,
  `idConductor` int NULL DEFAULT NULL,
  INDEX `FK_ConductorReporte_ReporteSiniestro`(`idReporteSiniestro` ASC) USING BTREE,
  INDEX `FK_ConductorReporte_Conductor`(`idConductor` ASC) USING BTREE,
  CONSTRAINT `FK_ConductorReporte_Conductor` FOREIGN KEY (`idConductor`) REFERENCES `Conductor` (`idConductor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ConductorReporte_ReporteSiniestro` FOREIGN KEY (`idReporteSiniestro`) REFERENCES `ReporteSiniestro` (`idReporteSiniestro`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Dictamen
-- ----------------------------
DROP TABLE IF EXISTS `Dictamen`;
CREATE TABLE `Dictamen`  (
  `idDictamen` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fechaCreacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idReporteSiniestro` int NOT NULL,
  `idUsuario` int NULL DEFAULT NULL,
  PRIMARY KEY (`idDictamen`) USING BTREE,
  INDEX `FK_tiene_ReporteSiniestro`(`idReporteSiniestro` ASC) USING BTREE,
  INDEX `FK_dictamina_Usuario`(`idUsuario` ASC) USING BTREE,
  CONSTRAINT `FK_dictamina_Usuario` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_tiene_ReporteSiniestro` FOREIGN KEY (`idReporteSiniestro`) REFERENCES `ReporteSiniestro` (`idReporteSiniestro`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Imagen
-- ----------------------------
DROP TABLE IF EXISTS `Imagen`;
CREATE TABLE `Imagen`  (
  `idImagen` int NOT NULL AUTO_INCREMENT,
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `idReporteSiniestro` int NOT NULL,
  PRIMARY KEY (`idImagen`) USING BTREE,
  INDEX `FK_contiene_ReporteSiniestro`(`idReporteSiniestro` ASC) USING BTREE,
  CONSTRAINT `FK_contiene_ReporteSiniestro` FOREIGN KEY (`idReporteSiniestro`) REFERENCES `ReporteSiniestro` (`idReporteSiniestro`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for PolizaSeguro
-- ----------------------------
DROP TABLE IF EXISTS `PolizaSeguro`;
CREATE TABLE `PolizaSeguro`  (
  `idPolizaSeguro` int NOT NULL AUTO_INCREMENT,
  `aniosCobertura` int NULL DEFAULT NULL,
  `fechaCompra` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `precio` float(6, 2) NULL DEFAULT NULL,
  `idVehiculo` int NOT NULL,
  `idTipoCobertura` int NULL DEFAULT NULL,
  PRIMARY KEY (`idPolizaSeguro`) USING BTREE,
  INDEX `FK_tiene_Vehiculo`(`idVehiculo` ASC) USING BTREE,
  INDEX `FK_tiene_PolizaSeguro`(`idTipoCobertura` ASC) USING BTREE,
  CONSTRAINT `FK_tiene_PolizaSeguro` FOREIGN KEY (`idTipoCobertura`) REFERENCES `TipoCobertura` (`idTipoCobertura`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_tiene_Vehiculo` FOREIGN KEY (`idVehiculo`) REFERENCES `Vehiculo` (`idVehiculo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ReporteSiniestro
-- ----------------------------
DROP TABLE IF EXISTS `ReporteSiniestro`;
CREATE TABLE `ReporteSiniestro`  (
  `idReporteSiniestro` int NOT NULL AUTO_INCREMENT,
  `fechaReporte` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `latitud` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `longitud` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `esDictaminado` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idReporteSiniestro`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ReporteVehiculo
-- ----------------------------
DROP TABLE IF EXISTS `ReporteVehiculo`;
CREATE TABLE `ReporteVehiculo`  (
  `idVehiculo` int NULL DEFAULT NULL,
  `idReporteSiniestro` int NULL DEFAULT NULL,
  INDEX `FK_ReporteVehiculo_Vehiculo`(`idVehiculo` ASC) USING BTREE,
  INDEX `FK_ReporteVehiculo_ReporteSiniestro`(`idReporteSiniestro` ASC) USING BTREE,
  CONSTRAINT `FK_ReporteVehiculo_ReporteSiniestro` FOREIGN KEY (`idReporteSiniestro`) REFERENCES `ReporteSiniestro` (`idReporteSiniestro`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ReporteVehiculo_Vehiculo` FOREIGN KEY (`idVehiculo`) REFERENCES `Vehiculo` (`idVehiculo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for TipoCobertura
-- ----------------------------
DROP TABLE IF EXISTS `TipoCobertura`;
CREATE TABLE `TipoCobertura`  (
  `idTipoCobertura` int NOT NULL AUTO_INCREMENT,
  `tipoCobertura` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `precioBase` float(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoCobertura`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for TipoUsuario
-- ----------------------------
DROP TABLE IF EXISTS `TipoUsuario`;
CREATE TABLE `TipoUsuario`  (
  `idTipoUsuario` int NOT NULL AUTO_INCREMENT,
  `tipoUsuario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoUsuario`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Usuario
-- ----------------------------
DROP TABLE IF EXISTS `Usuario`;
CREATE TABLE `Usuario`  (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fechaNacimiento` date NULL DEFAULT NULL,
  `contrasenia` varbinary(100) NULL DEFAULT NULL,
  `nombreUsuario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fechaRegistro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idTipoUsuario` int NULL DEFAULT NULL,
  PRIMARY KEY (`idUsuario`) USING BTREE,
  INDEX `FK_tiene_TipoUsuario`(`idTipoUsuario` ASC) USING BTREE,
  CONSTRAINT `FK_tiene_TipoUsuario` FOREIGN KEY (`idTipoUsuario`) REFERENCES `TipoUsuario` (`idTipoUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Vehiculo
-- ----------------------------
DROP TABLE IF EXISTS `Vehiculo`;
CREATE TABLE `Vehiculo`  (
  `idVehiculo` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `marca` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `numSerie` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `numPlaca` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `anio` int NULL DEFAULT NULL,
  `idConductor` int NULL DEFAULT NULL,
  PRIMARY KEY (`idVehiculo`) USING BTREE,
  INDEX `FK_tiene_Conductor`(`idConductor` ASC) USING BTREE,
  CONSTRAINT `FK_tiene_Conductor` FOREIGN KEY (`idConductor`) REFERENCES `Conductor` (`idConductor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Procedure structure for C_Conductor
-- ----------------------------
DROP PROCEDURE IF EXISTS `C_Conductor`;
delimiter ;;
CREATE PROCEDURE `C_Conductor`(IN _nombreCompleto VARCHAR(100),
		IN _fechaNacimiento DATE,
		IN _contrasenia VARCHAR(100),
		IN _idTipoUsuario INT,
		IN _telefono VARCHAR(10),
		IN _numeroLicencia VARCHAR(100))
BEGIN
	IF NOT EXISTS (SELECT * FROM Conductor AS C WHERE C.telefono = _telefono OR C.numeroLicencia = _numeroLicencia) THEN
			INSERT INTO Usuario VALUES(null, _nombreCompleto, _fechaNacimiento, AES_ENCRYPT(_contrasenia,"AES"), null, CURRENT_TIMESTAMP(), 1);
			INSERT INTO Conductor VALUES(null, _telefono, _numeroLicencia, LAST_INSERT_ID());
			SELECT TRUE AS Respuesta;
	ELSE
			SELECT FALSE AS Respuesta;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for C_Dictamen
-- ----------------------------
DROP PROCEDURE IF EXISTS `C_Dictamen`;
delimiter ;;
CREATE PROCEDURE `C_Dictamen`(IN _descripcion VARCHAR(250), 
		IN _idReporteSiniestro INT, 
		IN _idUsuario INT)
BEGIN
	IF NOT EXISTS (SELECT * FROM Dictamen AS D WHERE D.idReporteSiniestro = _idReporteSiniestro) THEN
			INSERT INTO Dictamen VALUES(NULL, _descripcion, CURRENT_TIMESTAMP, _idReporteSiniestro, _idUsuario);
			UPDATE ReporteSiniestro AS R SET R.esDictaminado = TRUE WHERE R.idReporteSiniestro = _idReporteSiniestro;
			SELECT TRUE AS Respuesta;
	ELSE
			SELECT FALSE AS Respuesta;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for C_Imagen
-- ----------------------------
DROP PROCEDURE IF EXISTS `C_Imagen`;
delimiter ;;
CREATE PROCEDURE `C_Imagen`(IN _url VARCHAR(500),
		IN _idReporteSiniestro INT)
BEGIN
		DECLARE cantidad INT;
		SET cantidad = (SELECT COUNT(*) FROM Imagen AS I WHERE I.idReporteSiniestro = _idReporteSiniestro);
		IF cantidad < 9 THEN
				INSERT INTO Imagen VALUES (NULL, _url, _idReporteSiniestro);
				SELECT TRUE AS Respuesta;
		ELSE
				SELECT FALSE AS Respuesta;
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for C_Poliza
-- ----------------------------
DROP PROCEDURE IF EXISTS `C_Poliza`;
delimiter ;;
CREATE PROCEDURE `C_Poliza`(IN _aniosCobertura INT,
		IN _precio FLOAT,
		IN _idVehiculo INT,
		IN _idTipoCobertura INT)
BEGIN
		IF EXISTS (SELECT * FROM PolizaSeguro AS P WHERE P.idVehiculo = _idVehiculo) THEN
				SELECT TRUE AS Respuesta;
		ELSE
				INSERT INTO PolizaSeguro VALUES(NULL, _aniosCobertura, CURRENT_TIMESTAMP(), _precio, _idVehiculo, _idTipoCobertura);
				SELECT FALSE AS Respuesta;
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for C_Reporte
-- ----------------------------
DROP PROCEDURE IF EXISTS `C_Reporte`;
delimiter ;;
CREATE PROCEDURE `C_Reporte`(IN _latitud VARCHAR(100),
		IN _longitud VARCHAR(100),
		IN _idVehiculo INT)
BEGIN
		INSERT INTO ReporteSiniestro VALUES(NULL, CURRENT_TIMESTAMP(), _latitud, _longitud, FALSE);
		INSERT INTO ReporteVehiculo VALUES(_idVehiculo, LAST_INSERT_ID());
		SELECT TRUE AS Respuesta;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for C_Usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `C_Usuario`;
delimiter ;;
CREATE PROCEDURE `C_Usuario`(IN _nombreCompleto VARCHAR(100),
		IN _fechaNacimiento DATE,
		IN _contrasenia VARCHAR(100),
		IN _nombreUsuario VARCHAR(100),
		IN _idTipoUsuario INT)
BEGIN
	IF NOT EXISTS (SELECT * FROM Usuario AS U WHERE U.nombreUsuario = _nombreUsuario) THEN
			INSERT INTO Usuario VALUES(null, _nombreCompleto, _fechaNacimiento, AES_ENCRYPT(_contrasenia,"AES"), _nombreUsuario, CURRENT_TIMESTAMP(), _idTipoUsuario);
			SELECT TRUE AS Respuesta;
	ELSE
			SELECT FALSE AS Respuesta;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for C_Vehiculo
-- ----------------------------
DROP PROCEDURE IF EXISTS `C_Vehiculo`;
delimiter ;;
CREATE PROCEDURE `C_Vehiculo`(IN _modelo VARCHAR(100),
		IN _marca VARCHAR(100),
		IN _numSerie VARCHAR(100),
		IN _color VARCHAR(100),
		IN _numPlaca VARCHAR(100),
		IN _anio INT,
		IN _idConductor INT)
BEGIN
		IF NOT EXISTS (SELECT * FROM Vehiculo AS V WHERE V.numSerie = _numSerie OR V.numPlaca = _numPlaca) THEN
				INSERT INTO Vehiculo VALUES(NULL, _modelo, _marca, _numSerie, _color, _numPlaca, _anio, _idConductor);
				SELECT TRUE AS Respuesta;
		ELSE
				SELECT FALSE AS Respuesta;
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for LoginConductor
-- ----------------------------
DROP PROCEDURE IF EXISTS `LoginConductor`;
delimiter ;;
CREATE PROCEDURE `LoginConductor`(IN _telefono VARCHAR(10),
    IN _contrasenia VARCHAR(100))
BEGIN
		IF EXISTS (SELECT * FROM Conductor AS C INNER JOIN Usuario AS U ON C.idUsuario = U.idUsuario WHERE BINARY C.telefono = _telefono AND BINARY U.contrasenia = AES_ENCRYPT(_contrasenia,"AES")) THEN
        SELECT U.idUsuario, U.nombreCompleto, U.idTipoUsuario, C.telefono, C.numeroLicencia FROM Conductor AS C INNER JOIN Usuario AS U ON C.idUsuario = U.idUsuario WHERE BINARY C.telefono = _telefono AND BINARY U.contrasenia = AES_ENCRYPT(_contrasenia,"AES");
				SELECT TRUE AS Respuesta;
    ELSE
        SELECT FALSE AS Respuesta;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for LoginUsuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `LoginUsuario`;
delimiter ;;
CREATE PROCEDURE `LoginUsuario`(IN _nombreUsuario VARCHAR(100),
		IN _contrasenia VARCHAR(100))
BEGIN
		IF EXISTS (SELECT * FROM Usuario AS U WHERE BINARY U.nombreUsuario = _nombreUsuario AND BINARY U.contrasenia = AES_ENCRYPT(_contrasenia,"AES")) THEN
				SELECT U.idUsuario, U.nombreCompleto, U.nombreUsuario, U.idTipoUsuario FROM Usuario AS U WHERE BINARY U.nombreUsuario = _nombreUsuario AND BINARY U.contrasenia = AES_ENCRYPT(_contrasenia,"AES");
				SELECT TRUE AS Respuesta;
    ELSE
        SELECT FALSE AS Respuesta;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_Conductor
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_Conductor`;
delimiter ;;
CREATE PROCEDURE `R_Conductor`()
BEGIN
		SELECT U.idUsuario, U.nombreCompleto, U.fechaNacimiento, U.idTipoUsuario, C.idConductor, C.telefono, C.numeroLicencia FROM Conductor AS C INNER JOIN Usuario AS U ON C.idUsuario = U.idUsuario;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_ConductorByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_ConductorByID`;
delimiter ;;
CREATE PROCEDURE `R_ConductorByID`(IN _idConductor INT)
BEGIN
		IF EXISTS (SELECT * FROM Conductor AS C WHERE C.idConductor = _idConductor) THEN
				SELECT U.idUsuario, U.nombreCompleto, U.fechaNacimiento, U.idTipoUsuario, C.idConductor, C.telefono, C.numeroLicencia FROM Conductor AS C INNER JOIN Usuario AS U ON C.idUsuario = U.idUsuario WHERE C.idConductor = _idConductor;
		ELSE 
				SELECT 'No existe un conductor con el ID proporcionado' AS Respuesta;
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_ContarImagenes
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_ContarImagenes`;
delimiter ;;
CREATE PROCEDURE `R_ContarImagenes`(IN _idReporteSiniestro INT)
BEGIN
		SELECT COUNT(*) FROM Imagen AS I WHERE I.idReporteSiniestro = _idReporteSiniestro;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_DictamenByIDReporte
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_DictamenByIDReporte`;
delimiter ;;
CREATE PROCEDURE `R_DictamenByIDReporte`(IN _idReporteSiniestro INT)
BEGIN
		IF EXISTS (SELECT * FROM Dictamen AS D WHERE D.idReporteSiniestro = _idReporteSiniestro) THEN
				SELECT D.idDictamen, D.descripcion, D.fechaCreacion, D.idReporteSiniestro, D.idUsuario FROM Dictamen AS D WHERE D.idReporteSiniestro = _idReporteSiniestro;
		ELSE 
				SELECT 'No existe dictamen para este reporte' AS Respuesta;
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_FotografiaByIDReporte
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_FotografiaByIDReporte`;
delimiter ;;
CREATE PROCEDURE `R_FotografiaByIDReporte`(IN _idReporteSiniestro INT)
BEGIN
	SELECT I.url FROM Imagen AS I WHERE I.idReporteSiniestro = _idReporteSiniestro;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_PolizaByIDVehiculo
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_PolizaByIDVehiculo`;
delimiter ;;
CREATE PROCEDURE `R_PolizaByIDVehiculo`(IN _idVehiculo INT)
BEGIN
		IF EXISTS (SELECT * FROM PolizaSeguro AS P WHERE P.idVehiculo = _idVehiculo) THEN
				SELECT P.idPolizaSeguro, P.aniosCobertura, P.fechaCompra, P.precio, P.idVehiculo, P.idTipoCobertura FROM PolizaSeguro AS P WHERE P.idVehiculo = _idVehiculo;
		ELSE 
				SELECT 'Este vehiculo aun no cuesta con una poliza contratada' AS Respuesta;
		END IF;
		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_Reporte
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_Reporte`;
delimiter ;;
CREATE PROCEDURE `R_Reporte`()
BEGIN
		SELECT R.idReporteSiniestro, R.fechaReporte, R.latitud, R.longitud, R.esDictaminado FROM ReporteSiniestro AS R;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_ReporteByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_ReporteByID`;
delimiter ;;
CREATE PROCEDURE `R_ReporteByID`(IN _idReporteSiniestro INT)
BEGIN
		IF EXISTS (SELECT * FROM ReporteSiniestro AS R WHERE R.idReporteSiniestro = _idReporteSiniestro) THEN
				SELECT R.idReporteSiniestro, R.fechaReporte, R.latitud, R.longitud, R.esDictaminado FROM ReporteSiniestro AS R WHERE R.idReporteSiniestro = _idReporteSiniestro;
		ELSE
				SELECT 'No existe reporte con el ID proporcionado';
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_TipoCobertura
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_TipoCobertura`;
delimiter ;;
CREATE PROCEDURE `R_TipoCobertura`()
BEGIN
		SELECT T.idTipoCobertura, T.tipoCobertura, T.precioBase FROM TipoCobertura AS T;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_TipoUsuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_TipoUsuario`;
delimiter ;;
CREATE PROCEDURE `R_TipoUsuario`()
BEGIN
		SELECT T.idTipoUsuario, T.tipoUsuario FROM TipoUsuario AS T;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_Usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_Usuario`;
delimiter ;;
CREATE PROCEDURE `R_Usuario`()
BEGIN
		SELECT U.idUsuario, U.nombreCompleto, U.fechaNacimiento, U.nombreUsuario, U.fechaRegistro, U.idTipoUsuario FROM Usuario AS U;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_UsuarioByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_UsuarioByID`;
delimiter ;;
CREATE PROCEDURE `R_UsuarioByID`(IN _idUsuario INT)
BEGIN
		IF EXISTS (SELECT * FROM Usuario AS U WHERE U.idUsuario = _idUsuario) THEN
				SELECT U.idUsuario, U.nombreCompleto, U.fechaNacimiento, U.nombreUsuario, U.fechaRegistro, U.idTipoUsuario FROM Usuario AS U WHERE U.idUsuario = _idUsuario;
		ELSE 
				SELECT 'El Usuario que busca no existe' AS Respuesta;
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_VehiculoByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_VehiculoByID`;
delimiter ;;
CREATE PROCEDURE `R_VehiculoByID`(IN _idVehiculo INT)
BEGIN
		IF EXISTS (SELECT * FROM Vehiculo AS V WHERE V.idVehiculo = _idVehiculo) THEN
				SELECT V.idVehiculo, V.modelo, V.marca, V.numSerie, V.color, V.numPlaca, V.anio, V.idConductor FROM Vehiculo AS V WHERE V.idVehiculo = _idVehiculo;
		ELSE 
				SELECT 'No existe un vehiculo con el ID proporcionado' AS Respuesta;
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for R_VehiculoByIDConductor
-- ----------------------------
DROP PROCEDURE IF EXISTS `R_VehiculoByIDConductor`;
delimiter ;;
CREATE PROCEDURE `R_VehiculoByIDConductor`(IN _idConductor INT)
BEGIN
		IF EXISTS (SELECT * FROM Vehiculo AS V WHERE V.idConductor = _idConductor) THEN
				SELECT V.idVehiculo, V.modelo, V.marca, V.numSerie, V.color, V.numPlaca, V.anio, V.idConductor FROM Vehiculo AS V WHERE V.idConductor = _idConductor;
		ELSE 
				SELECT 'El conductor proporcionado no cuenta con vehiculos registrados' AS Respuesta;
		END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

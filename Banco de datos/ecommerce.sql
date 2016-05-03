/*
Navicat MySQL Data Transfer

Source Server         : crud_pdo
Source Server Version : 50708
Source Host           : localhost:3306
Source Database       : ecommerce

Target Server Type    : MYSQL
Target Server Version : 50708
File Encoding         : 65001

Date: 2016-05-03 11:18:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for caracteristicas
-- ----------------------------
DROP TABLE IF EXISTS `caracteristicas`;
CREATE TABLE `caracteristicas` (
  `id_caract` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descrição` varchar(45) NOT NULL,
  `cantidade` int(11) NOT NULL DEFAULT '0',
  `precio` float NOT NULL,
  `idproduto` int(11) NOT NULL,
  PRIMARY KEY (`id_caract`),
  KEY `fk8_idx` (`idproduto`),
  CONSTRAINT `fk8` FOREIGN KEY (`idproduto`) REFERENCES `produtos` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caracteristicas
-- ----------------------------

-- ----------------------------
-- Table structure for carrinho
-- ----------------------------
DROP TABLE IF EXISTS `carrinho`;
CREATE TABLE `carrinho` (
  `idcarrinho` int(11) NOT NULL,
  `valor` float NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idcarrinho`),
  KEY `fk3_idx` (`iduser`),
  CONSTRAINT `fk3` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carrinho
-- ----------------------------

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `idcat` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idcat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('1', 'Celulares');
INSERT INTO `categorias` VALUES ('2', 'CDs');
INSERT INTO `categorias` VALUES ('3', 'DVDs');
INSERT INTO `categorias` VALUES ('4', 'Livros');

-- ----------------------------
-- Table structure for pagos
-- ----------------------------
DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos` (
  `idpago` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `idventa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk2_idx` (`idventa`),
  CONSTRAINT `fk2` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pagos
-- ----------------------------

-- ----------------------------
-- Table structure for produtos
-- ----------------------------
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `caminho` varchar(45) NOT NULL,
  `foto` geometry NOT NULL,
  `idsubcat` int(11) NOT NULL,
  `idcarrinho` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  PRIMARY KEY (`idproduto`),
  KEY `fk4_idx` (`idcarrinho`),
  KEY `fk5_idx` (`idventa`),
  KEY `fk6_idx` (`idsubcat`),
  CONSTRAINT `fk5` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk6` FOREIGN KEY (`idcarrinho`) REFERENCES `carrinho` (`idcarrinho`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk7` FOREIGN KEY (`idsubcat`) REFERENCES `subcategorias` (`idsubcat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produtos
-- ----------------------------

-- ----------------------------
-- Table structure for subcategorias
-- ----------------------------
DROP TABLE IF EXISTS `subcategorias`;
CREATE TABLE `subcategorias` (
  `idsubcat` int(11) NOT NULL,
  `idcat` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idsubcat`),
  KEY `fk6_idx` (`idcat`),
  CONSTRAINT `fk4` FOREIGN KEY (`idcat`) REFERENCES `categorias` (`idcat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subcategorias
-- ----------------------------
INSERT INTO `subcategorias` VALUES ('1', '1', 'Sony', 'http://www.google.com.br');
INSERT INTO `subcategorias` VALUES ('2', '1', 'LG', 'http://www.facebook.com');
INSERT INTO `subcategorias` VALUES ('3', '2', 'Programação', null);
INSERT INTO `subcategorias` VALUES ('4', '2', 'Aplicativos', null);
INSERT INTO `subcategorias` VALUES ('5', '3', 'Programação', null);
INSERT INTO `subcategorias` VALUES ('6', '3', 'Cinemas', null);
INSERT INTO `subcategorias` VALUES ('7', '3', 'Jogo', null);
INSERT INTO `subcategorias` VALUES ('8', '4', 'Aventuras', null);
INSERT INTO `subcategorias` VALUES ('9', '4', 'Drama', null);
INSERT INTO `subcategorias` VALUES ('10', '4', 'Programação', null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `iduser` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `endereço` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL,
  `valor` float NOT NULL,
  `time` datetime NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk1_idx` (`iduser`),
  CONSTRAINT `fk1` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ventas
-- ----------------------------

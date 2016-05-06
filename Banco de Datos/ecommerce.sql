/*
Navicat MySQL Data Transfer

Source Server         : crud_pdo
Source Server Version : 50708
Source Host           : localhost:3306
Source Database       : ecommerce

Target Server Type    : MYSQL
Target Server Version : 50708
File Encoding         : 65001

Date: 2016-05-06 11:24:57
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
  `caminho` varchar(45) NOT NULL,
  `foto` varchar(45) NOT NULL,
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
  `resumem` varchar(45) DEFAULT NULL,
  `precio` float NOT NULL,
  `idsubcat` int(11) NOT NULL,
  `caminho` varchar(45) NOT NULL,
  `foto` varchar(45) NOT NULL,
  `idcarrinho` int(11) DEFAULT NULL,
  `idventa` int(11) DEFAULT NULL,
  `idcat` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproduto`),
  KEY `fk4_idx` (`idcarrinho`),
  KEY `fk5_idx` (`idventa`),
  KEY `fk6_idx` (`idsubcat`),
  KEY `fk20_idx` (`idcat`),
  CONSTRAINT `fk20` FOREIGN KEY (`idcat`) REFERENCES `categorias` (`idcat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk5` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk6` FOREIGN KEY (`idcarrinho`) REFERENCES `carrinho` (`idcarrinho`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk7` FOREIGN KEY (`idsubcat`) REFERENCES `subcategorias` (`idsubcat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produtos
-- ----------------------------
INSERT INTO `produtos` VALUES ('1', 'Samsung Galaxy 10', '2GB RAM, espaço interno 32 GB', '150', '1', '/fotos/Celulares/Samsung/', 'samsung1.jpg', null, null, '1');
INSERT INTO `produtos` VALUES ('2', 'Samsung Galaxy 15', '4GB RAM, espaço interno 64 GB', '250', '1', '/fotos/Celulares/Samsung/', 'samsung2.jpg', null, null, '1');
INSERT INTO `produtos` VALUES ('3', 'Samsung Galaxy 20', '16GB RAM, espaço interno 100 GB', '500', '1', '/fotos/Celulares/Samsung/', 'samsung3.jpg', null, null, '1');
INSERT INTO `produtos` VALUES ('4', 'Sony 10', '2GB RAM, espaço interno 32 GB', '150', '11', '/fotos/Celulares/Sony/', 'sony1.jpg', null, null, '1');
INSERT INTO `produtos` VALUES ('5', 'Sony 15', '4GB RAM, espaço interno 32 GB', '250', '11', '/fotos/Celulares/Sony/', 'sony2.jpg', null, null, '1');
INSERT INTO `produtos` VALUES ('6', 'Sony 20', '8GB RAM, espaço interno 32 GB', '450', '11', '/fotos/Celulares/Sony/', 'sony2.jpg', null, null, '1');
INSERT INTO `produtos` VALUES ('7', 'LG 10', '4GB RAM, espaço interno 32 GB', '150', '2', '/fotos/Celulares/Lg/', 'lg1.jpg', null, null, '1');
INSERT INTO `produtos` VALUES ('8', 'LG 15', '4GB RAM, espaço interno 32 GB', '150', '2', '/fotos/Celulares/Lg/', 'lg2.jpg', null, null, '1');
INSERT INTO `produtos` VALUES ('9', 'LG 20', '4GB RAM, espaço interno 32 GB', '150', '2', '/fotos/Celulares/Lg/', 'lg3.jpg', null, null, '1');
INSERT INTO `produtos` VALUES ('10', '100 Cursos Informáticos', '4GB RAM, espaço interno 32 GB', '150', '3', '/fotos/CDs/Programacao/', 'prog1.jpg', null, null, '2');
INSERT INTO `produtos` VALUES ('11', 'Server 2003', '4GB RAM, espaço interno 32 GB', '150', '4', '/fotos/CDs/Aplicativos/', 'aplicativos1.gif', null, null, '2');
INSERT INTO `produtos` VALUES ('12', 'Curso de PHP', '4GB RAM, espaço interno 32 GB', '150', '5', '/fotos/DVDs/Programacao/', 'prog1.jpg', null, null, '3');
INSERT INTO `produtos` VALUES ('13', 'As 50 Sombras de Grey', '4GB RAM, espaço interno 32 GB', '150', '6', '/fotos/DVDs/Cinema/', 'cinema1.jpg', null, null, '3');
INSERT INTO `produtos` VALUES ('14', 'Jogos Vorazes Parte I', '4GB RAM, espaço interno 32 GB', '150', '6', '/fotos/DVDs/Cinema/', 'cinema2.jpg', null, null, '3');
INSERT INTO `produtos` VALUES ('15', 'Jogos de Interesses', '4GB RAM, espaço interno 32 GB', '150', '6', '/fotos/DVDs/Cinema/', 'cinema3.jpg', null, null, '3');
INSERT INTO `produtos` VALUES ('16', 'Soccer 2016', '4GB RAM, espaço interno 32 GB', '150', '7', '/fotos/DVDs/Jogos/', 'jogos1.jpg', null, null, '3');
INSERT INTO `produtos` VALUES ('17', 'DEADPOOL', '4GB RAM, espaço interno 32 GB', '150', '7', '/fotos/DVDs/Jogos/', 'jogos2.jpg', null, null, '3');
INSERT INTO `produtos` VALUES ('18', 'Fable the Journey', '4GB RAM, espaço interno 32 GB', '150', '7', '/fotos/DVDs/Jogos/', 'jogos3.jpg', null, null, '3');
INSERT INTO `produtos` VALUES ('19', 'Captain America', '4GB RAM, espaço interno 32 GB', '150', '7', '/fotos/DVDs/Jogos/', 'jogos4.jpg', null, null, '3');
INSERT INTO `produtos` VALUES ('20', 'Game of Thrones', '4GB RAM, espaço interno 32 GB', '150', '8', '/fotos/Livros/Aventuras/', 'aventura1.jpg', null, null, '4');
INSERT INTO `produtos` VALUES ('21', 'As Crónicas de Narnia', '4GB RAM, espaço interno 32 GB', '150', '8', '/fotos/Livros/Aventuras/', 'aventura2.jpg', null, null, '4');
INSERT INTO `produtos` VALUES ('22', 'As aventuras do jovem', '4GB RAM, espaço interno 32 GB', '150', '8', '/fotos/Livros/Aventuras/', 'aventura3.jpg', null, null, '4');
INSERT INTO `produtos` VALUES ('23', 'A menina que roubava', '4GB RAM, espaço interno 32 GB', '150', '9', '/fotos/Livros/Drama/', 'drama1.jpg', null, null, '4');
INSERT INTO `produtos` VALUES ('24', 'A Carícia do vento', '4GB RAM, espaço interno 32 GB', '150', '9', '/fotos/Livros/Drama/', 'drama2.jpg', null, null, '4');
INSERT INTO `produtos` VALUES ('25', 'O Caçador de Pipas', '4GB RAM, espaço interno 32 GB', '150', '9', '/fotos/Livros/Drama/', 'drama3.jpg', null, null, '4');
INSERT INTO `produtos` VALUES ('26', 'Programação PHP', '4GB RAM, espaço interno 32 GB', '150', '10', '/fotos/Livros/Programacao/', 'prog1.jpg', null, null, '4');
INSERT INTO `produtos` VALUES ('27', 'Algoritmos C', '4GB RAM, espaço interno 32 GB', '150', '10', '/fotos/Livros/Programacao/', 'prog2.jpg', null, null, '4');
INSERT INTO `produtos` VALUES ('28', 'Programação Assembly', '4GB RAM, espaço interno 32 GB', '150', '10', '/fotos/Livros/Programacao/', 'prog3.jpg', null, null, '4');
INSERT INTO `produtos` VALUES ('29', 'Algoritmos', '4GB RAM, espaço interno 32 GB', '150', '10', '/fotos/Livros/Programacao/', 'prog4.jpg', null, null, '4');

-- ----------------------------
-- Table structure for subcategorias
-- ----------------------------
DROP TABLE IF EXISTS `subcategorias`;
CREATE TABLE `subcategorias` (
  `idsubcat` int(11) NOT NULL,
  `idcat` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`idsubcat`),
  KEY `fk6_idx` (`idcat`),
  CONSTRAINT `fk4` FOREIGN KEY (`idcat`) REFERENCES `categorias` (`idcat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subcategorias
-- ----------------------------
INSERT INTO `subcategorias` VALUES ('1', '1', 'samsung');
INSERT INTO `subcategorias` VALUES ('2', '1', 'LG');
INSERT INTO `subcategorias` VALUES ('3', '2', 'Programação');
INSERT INTO `subcategorias` VALUES ('4', '2', 'Aplicativos');
INSERT INTO `subcategorias` VALUES ('5', '3', 'Programação');
INSERT INTO `subcategorias` VALUES ('6', '3', 'Cinemas');
INSERT INTO `subcategorias` VALUES ('7', '3', 'Jogo');
INSERT INTO `subcategorias` VALUES ('8', '4', 'Aventuras');
INSERT INTO `subcategorias` VALUES ('9', '4', 'Drama');
INSERT INTO `subcategorias` VALUES ('10', '4', 'Programação');
INSERT INTO `subcategorias` VALUES ('11', '1', 'Sony');

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

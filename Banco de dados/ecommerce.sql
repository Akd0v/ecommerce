/*
Navicat MySQL Data Transfer

Source Server         : crud_pdo
Source Server Version : 50708
Source Host           : localhost:3306
Source Database       : ecommerce

Target Server Type    : MYSQL
Target Server Version : 50708
File Encoding         : 65001

Date: 2016-05-13 15:27:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for caracteristicas
-- ----------------------------
DROP TABLE IF EXISTS `caracteristicas`;
CREATE TABLE `caracteristicas` (
  `id_caract` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descrição` varchar(45) NOT NULL,
  `cantidade` int(11) NOT NULL DEFAULT '0',
  `precio` float NOT NULL,
  `idproduto` int(11) NOT NULL,
  `caminho` varchar(45) NOT NULL,
  `foto` varchar(45) NOT NULL,
  PRIMARY KEY (`id_caract`),
  KEY `fk8_idx` (`idproduto`),
  CONSTRAINT `fk1` FOREIGN KEY (`idproduto`) REFERENCES `produtos` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caracteristicas
-- ----------------------------

-- ----------------------------
-- Table structure for carrinho
-- ----------------------------
DROP TABLE IF EXISTS `carrinho`;
CREATE TABLE `carrinho` (
  `idcarrinho` int(11) NOT NULL AUTO_INCREMENT,
  `valor` float NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idcarrinho`),
  KEY `fk3_idx` (`iduser`),
  CONSTRAINT `fk2` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carrinho
-- ----------------------------

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `idcat` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `pai` int(11) DEFAULT '0',
  `nivel` int(11) DEFAULT '0',
  PRIMARY KEY (`idcat`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('1', 'Celulares', '0', '0');
INSERT INTO `categorias` VALUES ('2', 'CDs', '0', '0');
INSERT INTO `categorias` VALUES ('3', 'DVDs', '0', '0');
INSERT INTO `categorias` VALUES ('4', 'Livros', '0', '0');
INSERT INTO `categorias` VALUES ('5', 'LG', '1', '1');
INSERT INTO `categorias` VALUES ('6', 'Sony', '1', '1');
INSERT INTO `categorias` VALUES ('7', 'Programação', '2', '1');
INSERT INTO `categorias` VALUES ('8', 'Aplicativos', '2', '1');
INSERT INTO `categorias` VALUES ('9', 'Programação', '3', '1');
INSERT INTO `categorias` VALUES ('10', 'Cinemas', '3', '1');
INSERT INTO `categorias` VALUES ('11', 'Jogos', '3', '1');
INSERT INTO `categorias` VALUES ('12', 'Programação', '4', '1');
INSERT INTO `categorias` VALUES ('13', 'Aventuras', '4', '1');
INSERT INTO `categorias` VALUES ('14', 'Drama', '4', '1');
INSERT INTO `categorias` VALUES ('15', 'Samsung', '1', '1');

-- ----------------------------
-- Table structure for pagos
-- ----------------------------
DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos` (
  `idpago` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `idventa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk2_idx` (`idventa`),
  CONSTRAINT `fk3` FOREIGN KEY (`idventa`) REFERENCES `vendas` (`idvenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pagos
-- ----------------------------

-- ----------------------------
-- Table structure for produtos
-- ----------------------------
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `resumem` varchar(45) DEFAULT NULL,
  `precio` float NOT NULL,
  `caminho` varchar(45) NOT NULL,
  `idcat` int(11) DEFAULT NULL,
  `foto` varchar(45) NOT NULL,
  `idcarrinho` int(11) DEFAULT NULL,
  `idventa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproduto`),
  KEY `fk4_idx` (`idcarrinho`),
  KEY `fk5_idx` (`idventa`),
  KEY `fk20_idx` (`idcat`),
  CONSTRAINT `fk4` FOREIGN KEY (`idcat`) REFERENCES `categorias` (`idcat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk5` FOREIGN KEY (`idventa`) REFERENCES `vendas` (`idvenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk6` FOREIGN KEY (`idcarrinho`) REFERENCES `carrinho` (`idcarrinho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produtos
-- ----------------------------
INSERT INTO `produtos` VALUES ('1', 'Samsung Galaxy 10', '2GB RAM, espaço interno 32 GB', '150', '/fotos/Celulares/Samsung/', '15', 'samsung1.jpg', null, null);
INSERT INTO `produtos` VALUES ('2', 'Samsung Galaxy 15', '4GB RAM, espaço interno 64 GB', '250', '/fotos/Celulares/Samsung/', '15', 'samsung2.jpg', null, null);
INSERT INTO `produtos` VALUES ('3', 'Samsung Galaxy 20', '16GB RAM, espaço interno 100 GB', '500', '/fotos/Celulares/Samsung/', '15', 'samsung3.jpg', null, null);
INSERT INTO `produtos` VALUES ('4', 'Sony 10', '2GB RAM, espaço interno 32 GB', '150', '/fotos/Celulares/Sony/', '6', 'sony1.jpg', null, null);
INSERT INTO `produtos` VALUES ('5', 'Sony 15', '4GB RAM, espaço interno 32 GB', '250', '/fotos/Celulares/Sony/', '6', 'sony2.jpg', null, null);
INSERT INTO `produtos` VALUES ('6', 'Sony 20', '8GB RAM, espaço interno 32 GB', '450', '/fotos/Celulares/Sony/', '6', 'sony2.jpg', null, null);
INSERT INTO `produtos` VALUES ('7', 'LG 10', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Celulares/Lg/', '5', 'lg1.jpg', null, null);
INSERT INTO `produtos` VALUES ('8', 'LG 15', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Celulares/Lg/', '5', 'lg2.jpg', null, null);
INSERT INTO `produtos` VALUES ('9', 'LG 20', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Celulares/Lg/', '5', 'lg3.jpg', null, null);
INSERT INTO `produtos` VALUES ('10', '100 Cursos Informáticos', '4GB RAM, espaço interno 32 GB', '150', '/fotos/CDs/Programacao/', '7', 'prog1.jpg', null, null);
INSERT INTO `produtos` VALUES ('11', 'Server 2003', '4GB RAM, espaço interno 32 GB', '150', '/fotos/CDs/Aplicativos/', '8', 'aplicativos1.gif', null, null);
INSERT INTO `produtos` VALUES ('12', 'Curso de PHP', '4GB RAM, espaço interno 32 GB', '150', '/fotos/DVDs/Programacao/', '9', 'prog1.jpg', null, null);
INSERT INTO `produtos` VALUES ('13', 'As 50 Sombras de Grey', '4GB RAM, espaço interno 32 GB', '150', '/fotos/DVDs/Cinema/', '10', 'cinema1.jpg', null, null);
INSERT INTO `produtos` VALUES ('14', 'Jogos Vorazes Parte I', '4GB RAM, espaço interno 32 GB', '150', '/fotos/DVDs/Cinema/', '10', 'cinema2.jpg', null, null);
INSERT INTO `produtos` VALUES ('15', 'Jogos de Interesses', '4GB RAM, espaço interno 32 GB', '150', '/fotos/DVDs/Cinema/', '10', 'cinema3.jpg', null, null);
INSERT INTO `produtos` VALUES ('16', 'Soccer 2016', '4GB RAM, espaço interno 32 GB', '150', '/fotos/DVDs/Jogos/', '11', 'jogos1.jpg', null, null);
INSERT INTO `produtos` VALUES ('17', 'DEADPOOL', '4GB RAM, espaço interno 32 GB', '150', '/fotos/DVDs/Jogos/', '11', 'jogos2.jpg', null, null);
INSERT INTO `produtos` VALUES ('18', 'Fable the Journey', '4GB RAM, espaço interno 32 GB', '150', '/fotos/DVDs/Jogos/', '11', 'jogos3.jpg', null, null);
INSERT INTO `produtos` VALUES ('19', 'Captain America', '4GB RAM, espaço interno 32 GB', '150', '/fotos/DVDs/Jogos/', '11', 'jogos4.jpg', null, null);
INSERT INTO `produtos` VALUES ('20', 'Game of Thrones', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Livros/Aventuras/', '13', 'aventura1.jpg', null, null);
INSERT INTO `produtos` VALUES ('21', 'As Crónicas de Narnia', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Livros/Aventuras/', '13', 'aventura2.jpg', null, null);
INSERT INTO `produtos` VALUES ('22', 'As aventuras do jovem', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Livros/Aventuras/', '13', 'aventura3.jpg', null, null);
INSERT INTO `produtos` VALUES ('23', 'A menina que roubava', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Livros/Drama/', '14', 'drama1.jpg', null, null);
INSERT INTO `produtos` VALUES ('24', 'A Carícia do vento', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Livros/Drama/', '14', 'drama2.jpg', null, null);
INSERT INTO `produtos` VALUES ('25', 'O Caçador de Pipas', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Livros/Drama/', '14', 'drama3.jpg', null, null);
INSERT INTO `produtos` VALUES ('26', 'Programação PHP', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Livros/Programacao/', '12', 'prog1.jpg', null, null);
INSERT INTO `produtos` VALUES ('27', 'Algoritmos C', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Livros/Programacao/', '12', 'prog2.jpg', null, null);
INSERT INTO `produtos` VALUES ('28', 'Programação Assembly', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Livros/Programacao/', '12', 'prog3.jpg', null, null);
INSERT INTO `produtos` VALUES ('29', 'Algoritmos', '4GB RAM, espaço interno 32 GB', '150', '/fotos/Livros/Programacao/', '12', 'prog4.jpg', null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `nome` varchar(250) DEFAULT NULL,
  `apellido` varchar(250) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `endereço` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('29', 'pp', 'aa', 'aa', 'kkk@kkk.cd', 'micasa #2', 'f2bd4ae550246a64e32c891931bd4298f20c32ec');
INSERT INTO `users` VALUES ('30', 'ppp', 'aa', 'aa', 'kkk@kkk.cd', 'micasa #2', '7af9eab9ca37419ca4eeaeec52ec1051fb284c1c');
INSERT INTO `users` VALUES ('31', 'hh', 'hh', 'hh', 'kkk@kkk.cd', 'hh', '3784f21902a9714a1d30a0632a433ebd0fc77a0f');
INSERT INTO `users` VALUES ('32', 'll', 'll', 'll', 'll@ll.ll', 'll', '5ce424a7a5e599d36da8a34eb00bf79efa5fdc9f');
INSERT INTO `users` VALUES ('33', 'dd', 'dd', 'dd', 'dd@dd.com', 'dd', '7eb178b5e444ddbc2ab1c3aa98b9bec614c97e03');
INSERT INTO `users` VALUES ('34', 'qq', 'qq', 'qq', 'dd@dd.com', 'qq', '3f13c872caa0a4eda845a97df73f0cd6634362c8');
INSERT INTO `users` VALUES ('35', 'nn', 'nn', 'nn', 'dd@dd.com', 'nn', '835207fbbc6481c0014399bb9626e3766f59857c');

-- ----------------------------
-- Table structure for vendas
-- ----------------------------
DROP TABLE IF EXISTS `vendas`;
CREATE TABLE `vendas` (
  `idvenda` int(11) NOT NULL AUTO_INCREMENT,
  `valor` float NOT NULL,
  `time` datetime NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idvenda`),
  KEY `fk1_idx` (`iduser`),
  CONSTRAINT `fk7` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vendas
-- ----------------------------

-- ----------------------------
-- Table structure for vendas_produtos
-- ----------------------------
DROP TABLE IF EXISTS `vendas_produtos`;
CREATE TABLE `vendas_produtos` (
  `vendas_idvendas` int(11) NOT NULL,
  `produtos_idprodutos` int(11) NOT NULL,
  PRIMARY KEY (`vendas_idvendas`,`produtos_idprodutos`),
  KEY `fk7_idx` (`produtos_idprodutos`),
  CONSTRAINT `fk8` FOREIGN KEY (`vendas_idvendas`) REFERENCES `vendas` (`idvenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk9` FOREIGN KEY (`produtos_idprodutos`) REFERENCES `produtos` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vendas_produtos
-- ----------------------------

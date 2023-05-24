CREATE DATABASE  IF NOT EXISTS `GerenciadordeTarefas` 

USE `GerenciadordeTarefas`;

--

DROP TABLE IF EXISTS `categoria_tarefa`;

CREATE TABLE `categoria_tarefa` (
  `cod` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






LOCK TABLES `categoria_tarefa` WRITE;

INSERT INTO `categoria_tarefa` VALUES (1,'Trabalho'),(2,'Escola'),(3,'Estágio'),(4,'Compra');

UNLOCK TABLES;




DROP TABLE IF EXISTS `perfil_usuario`;

CREATE TABLE `perfil_usuario` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;





LOCK TABLES `perfil_usuario` WRITE;

INSERT INTO `perfil_usuario` VALUES (1,'Administrador'),(2,'Usuário Padrão');

UNLOCK TABLES;





DROP TABLE IF EXISTS `tarefas`;

CREATE TABLE `tarefas` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `usuario_cod` int(11) NOT NULL,
  `categoria_cod` int(11) NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_tarefas_usuario1` (`usuario_cod`),
  KEY `fk_tarefas_categoria1` (`categoria_cod`),
  CONSTRAINT `fk_tarefas_categoria1` FOREIGN KEY (`categoria_cod`) REFERENCES `categoria_tarefa` (`cod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarefas_usuario1` FOREIGN KEY (`usuario_cod`) REFERENCES `usuario` (`cod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;




LOCK TABLES `tarefas` WRITE;

INSERT INTO `tarefas` VALUES (7,'Comprar Iogurte','2019-08-23','12:00:00','Teste',5,4),(8,'Estudar Matemática','2019-08-27','09:00:00','',4,2),(11,'Comprar Iogurte','2019-08-01','12:12:00','Activia',5,3),(12,'Comprar Pão','2019-08-16','13:13:00','',3,1),(13,'Estudar Geografia','2019-08-31','13:15:00','Estudar para a prova que será aplicada amanhã',3,2),(14,'Comprar Café','2019-08-31','09:09:00','Café Solúvel',5,4);

UNLOCK TABLES;



DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(150) NOT NULL,
  `perfil_cod` int(11) NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_usuario_perfil1_idx` (`perfil_cod`),
  CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`perfil_cod`) REFERENCES `perfil_usuario` (`cod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;





LOCK TABLES `usuario` WRITE;

INSERT INTO `usuario` VALUES (3,'JOAO','joao@gmail.com','202cb962ac59075b964b07152d234b70',2),(4,'teste','teste@gmail.com','202cb962ac59075b964b07152d234b70',2),(5,'Administrador','admin@gmail.com','21232f297a57a5a743894a0e4a801fc3',1);

UNLOCK TABLES;




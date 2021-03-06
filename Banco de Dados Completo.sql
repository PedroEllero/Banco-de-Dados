-- REPOSITORIO: https://github.com/PedroEllero/Banco-de-Dados

DROP TABLE IF EXISTS DERROTAMONSTRO, VISUAL, ACESSORIO, ARMADURA, MUNDO, PERSONAGEM, INVENTARIO, MASCOTE, MONSTRO ,CAIXA, EQUIPAMENTO;


CREATE TABLE EQUIPAMENTO(
nomeEquipamento VARCHAR(20) NOT NULL PRIMARY KEY,
statusEquipamento VARCHAR(20) NOT NULL,
nivelRequirido INTEGER NOT NULL
);

CREATE TABLE CAIXA(
idCaixa INTEGER NOT NULL PRIMARY KEY,
raridade VARCHAR(20) NOT NULL,
quantidadeItens INTEGER NOT NULL,
nomeEquipamento VARCHAR(20) NOT NULL,
FOREIGN KEY (nomeEquipamento) REFERENCES EQUIPAMENTO(nomeEquipamento)	
);

CREATE TABLE MONSTRO(
nomeMonstro VARCHAR(20) NOT NULL PRIMARY KEY,
nivel INTEGER NOT NULL,
raca VARCHAR(20),
idCaixa INTEGER NOT NULL,
FOREIGN KEY (idCaixa) REFERENCES CAIXA(idCaixa)
);

CREATE TABLE MASCOTE(
nomeMascote VARCHAR(20) NOT NULL PRIMARY KEY,
raca VARCHAR(20) NOT NULL,
nivelRequirido INTEGER NOT NULL
);

CREATE TABLE INVENTARIO(
idInventario INTEGER NOT NULL PRIMARY KEY,
capacidadeMaxima INTEGER NOT NULL,
quantidadeItens INTEGER NOT NULL,
nomeMascote VARCHAR(20) NOT NULL,
nomeEquipamento VARCHAR(20) NOT NULL,
FOREIGN KEY (nomeMascote) REFERENCES MASCOTE(nomeMascote),
FOREIGN KEY (nomeEquipamento) REFERENCES EQUIPAMENTO(nomeEquipamento)
);

CREATE TABLE PERSONAGEM(
nomePersonagem VARCHAR(20) NOT NULL PRIMARY KEY,
idPersonagem VARCHAR(20) NOT NULL,
nivel INTEGER NOT NULL,
idInventario INTEGER NOT NULL,
nomeMascote VARCHAR(20) NOT NULL,
nomeEquipamento VARCHAR(20) NOT NULL,
FOREIGN KEY (idInventario) REFERENCES INVENTARIO(idInventario),
FOREIGN KEY (nomeMascote) REFERENCES MASCOTE(nomeMascote),
FOREIGN KEY (nomeEquipamento) REFERENCES EQUIPAMENTO(nomeEquipamento)
);

CREATE TABLE MUNDO(
nomeMundo VARCHAR(20) NOT NULL PRIMARY KEY,
idMundo INTEGER NOT NULL,
tipoMundo VARCHAR(20) NOT NULL,
nomeMonstro VARCHAR(20) NOT NULL,
nomePersonagem VARCHAR(20) NOT NULL,
FOREIGN KEY (nomeMonstro) REFERENCES MONSTRO(nomeMonstro),
FOREIGN KEY (nomePersonagem) REFERENCES PERSONAGEM(nomePersonagem)
);

CREATE TABLE ARMADURA(
nomeEquipamento VARCHAR(20) NOT NULL PRIMARY KEY,
descricao VARCHAR(20) NOT NULL,
tipo VARCHAR(20) NOT NULL,
slot INTEGER NOT NULL,
FOREIGN KEY (nomeEquipamento) REFERENCES EQUIPAMENTO(nomeEquipamento) ON DELETE CASCADE
);

CREATE TABLE ACESSORIO(
nomeEquipamento VARCHAR(20) NOT NULL PRIMARY KEY,
descricao VARCHAR(20) NOT NULL,
slot INTEGER NOT NULL,
habilidade VARCHAR(20) NOT NULL,
FOREIGN KEY (nomeEquipamento) REFERENCES EQUIPAMENTO(nomeEquipamento) ON DELETE CASCADE
);

CREATE TABLE VISUAL(
nomeEquipamento VARCHAR(20) NOT NULL PRIMARY KEY,
raridade VARCHAR(20) NOT NULL,
descricao VARCHAR(20) NOT NULL,
cor VARCHAR(20) NOT NULL,
FOREIGN KEY (nomeEquipamento) REFERENCES EQUIPAMENTO(nomeEquipamento) ON DELETE CASCADE
);

CREATE TABLE DERROTAMONSTRO(
nomeMonstro VARCHAR(20) NOT NULL,
nomePersonagem VARCHAR(20) NOT NULL,
PRIMARY KEY(nomeMonstro, nomePersonagem),
FOREIGN KEY (nomeMonstro) REFERENCES MONSTRO(nomeMonstro),
FOREIGN KEY (nomePersonagem) REFERENCES PERSONAGEM(nomePersonagem)
);

INSERT INTO EQUIPAMENTO(nomeEquipamento, statusEquipamento, nivelRequirido) VALUES ('Cerberus', '??pico', 78), ('Cristal', '??pico', 55), ('Andarilho', 'Normal', 28), ('Aventura', 'Normal', 1), ('Berkas', 'Lend??rio', 85), ('Petrushka', 'Lend??rio', 80), ('Guardi??o Eterno', 'M??tico', 1), ('Selvagem', 'Raro', 54), ('Destrui????o', '??pico', 63), ('Ellia', 'M??tico', 1);
INSERT INTO CAIXA(idCaixa, raridade, quantidadeItens, nomeEquipamento) VALUES (1, 'normal', 5, 'Aventura'), (2, 'raro', 2, 'Selvagem'), (3, '??pico', 7, 'Cristal'), (4, '??pico', 8, 'Cerberus'), (5, 'Lend??rio', 15, 'Berkas'), (6, 'Lend??rio', 15, 'Petrushka'), (7, '??pico', 3, 'Destrui????o'), (8, 'M??tico', 14, 'Guardi??o Eterno'), (9, 'M??tico', 7, 'Ellia'), (10, 'normal', 6, 'Andarilho');
INSERT INTO MONSTRO(nomeMonstro, nivel, raca, idCaixa) VALUES ('Rainha Harpia', 10, 'Ave', 1), ('Gaia', 66, 'Planta', 2), ('Lenacien', 54, 'Besta', 3), ('Odin', 75, 'Deus N??rdico', 4), ('Drag??o Rei', 85, 'Drag??o', 5), ('Rei dos An??es', 75, 'An??o', 6), ('Periett', 66, 'Lorde da Destrui????o', 7), ('Duel', 85, 'Vingador', 8), ('Rei Gosma', 10, 'Slime', 9), ('Gaicoz', 24, 'Samurai', 10);
INSERT INTO MASCOTE(nomeMascote, raca, nivelRequirido) VALUES ('Slime Verde', 'Slime', 1), ('Thanatos', 'Deus', 85), ('Flubell', 'Coelho', 10), ('Mary Jane', 'Empregada', 30), ('Bilbo', 'Hobbit', 80), ('Batman', 'Morcego', 42), ('Sapo Medonho', 'R??ptil', 20), ('Rei dos Vassalos', 'Humano', 60), ('Hidra', 'Drag??o', 75), ('Sphinx', 'Gato', 12);
INSERT INTO INVENTARIO(idInventario, capacidadeMaxima, quantidadeItens, nomeMascote, nomeEquipamento) VALUES (1, 100, 85, 'Slime Verde', 'Cerberus'), (2, 350, 268, 'Thanatos', 'Cristal'), (3, 20, 10, 'Flubell', 'Aventura'), (4, 1820, 1267, 'Mary Jane', 'Selvagem'), (5, 1360, 892, 'Bilbo', 'Petrushka'), (6, 10325, 4625, 'Batman', 'Berkas'), (7, 370, 205, 'Sapo Medonho', 'Guardi??o Eterno'),(8, 102, 100, 'Rei dos Vassalos', 'Andarilho'), (9, 8503, 7416, 'Hidra', 'Destrui????o'),(10, 3465, 3005, 'Sphinx', 'Ellia');
INSERT INTO PERSONAGEM(nomePersonagem, idPersonagem, nivel, idInventario, nomeMascote, nomeEquipamento) VALUES ('Elesis', 1, 20, 1, 'Slime Verde', 'Cerberus'), ('Lire', 2, 44, 9, 'Hidra', 'Destrui????o'), ('Arme', 3, 60, 5, 'Bilbo', 'Petrushka'), ('Lass', 4, 85, 6, 'Batman', 'Berkas'), ('Ryan', 5, 72, 4, 'Mary Jane', 'Selvagem'), ('Ronan', 6, 12, 7, 'Sapo Medonho', 'Guardi??o Eterno'), ('Jin', 7, 30, 2, 'Thanatos', 'Cristal'),('Amy', 8, 28, 3, 'Flubell', 'Aventura'), ('Sieghart', 9, 85, 8, 'Rei dos Vassalos', 'Andarilho'), ('Mari', 10, 78, 10, 'Sphinx', 'Ellia');
INSERT INTO MUNDO(nomeMundo, idMundo, tipoMundo, nomeMonstro, nomePersonagem) VALUES ('TestWorld', 1, 'test', 'Gaia', 'Lass'), ('WestLuterra', 2, 'Novato', 'Rainha Harpia', 'Elesis'), ('Revelry Row', 3, 'Musical', 'Lenacien', 'Sieghart'), ('Woeful Drylands', 4, 'Desertico', 'Periett', 'Ronan'), ('Scarred Crimson Land', 5, 'Vulcanico', 'Duel', 'Jin'), ('Red Sand Desert', 6, 'DesertoVermelho', 'Odin', 'Amy'), ('Tooki Island', 7, 'BonusWorld', 'Drag??o Rei', 'Mari'), ('Snowpang Island', 8, 'Nevado', 'Gaicoz', 'Ryan'), ('Mercia', 9, 'MundoDeCa??a', 'Rei Gosma', 'Lire'), ('Walpurgis', 10, 'MundoFantasma', 'Rei dos An??es', 'Arme');
INSERT INTO ARMADURA(nomeEquipamento, descricao, tipo, slot) VALUES ('Cerberus', 'Armadura para peito', '??pico', 3), ('Cristal', 'Arma de punho', '??pico', 6), ('Andarilho', 'Capacete', 'Normal', 0), ('Aventura', 'Luvas', 'Normal', 0), ('Berkas', 'Armadura de conjunto', 'Lend??rio', 8), ('Petrushka', 'Botas', 'Lend??rio', 5), ('Destrui????o', 'Capa', '??pico', 2), ('Guardi??o Eterno', 'Arma de conjunto', 'M??tico', 6), ('Ellia', 'Cal??a', 'M??tico', 4);
INSERT INTO ACESSORIO(nomeEquipamento, descricao, slot, habilidade) VALUES ('Cerberus', 'Diadema', 6, 'Queima inimigos'), ('Cristal', 'Escudos', 4, 'Cortes profundos'), ('Andarilho', 'Asas', 2, 'Voar livremente'), ('Aventura', 'M??scara', 1, 'Sem Efeito'), ('Berkas', 'Anel', 9, 'Transforma em drag??o'), ('Petrushka', 'M??scara', 6, 'passe livre'), ('Guardi??o Eterno', 'Acessorio conjunto', 20, 'Prismas Brilhantes'), ('Selvagem', 'Faca', 0, 'Sem Efeitos'), ('Destrui????o', 'Faca', 7, 'Estilha??ar inimigos'), ('Ellia', 'Anel', 15, 'N??voa Sombria');
INSERT INTO VISUAL(nomeEquipamento, raridade, descricao, cor) VALUES ('Cerberus', '??pico', 'Capacete Visual', 'Vermelho'), ('Cristal', '??pico', 'Escudo Visual', 'Branco'), ('Andarilho', 'Normal', 'Asas Visuais', 'Marrom'), ('Aventura', 'Normal', 'Botas Visuais', 'cinza'), ('Berkas', 'Lend??rio', 'Armadura Visual', 'Preto'), ('Petrushka', 'Lend??rio', 'M??scara Visual', 'Branco e Preto'), ('Destrui????o', '??pico', 'Capa Visual', 'Laranja'), ('Guardi??o Eterno', 'M??tico', 'Conjunto Visual', 'Branco e Vermelho'), ('Selvagem', 'Raro', 'Faca Visual', 'Azul'), ('Ellia', 'M??tico', 'Arma Visual', 'Vermelho e Preto');
INSERT INTO DERROTAMONSTRO(nomeMonstro, nomePersonagem) VALUES ('Rainha Harpia', 'Elesis'), ('Gaia', 'Lire'), ('Lenacien', 'Arme'), ('Odin', 'Lass'), ('Drag??o Rei', 'Ryan'), ('Rei dos An??es', 'Ronan'), ('Periett', 'Jin'), ('Duel', 'Amy'), ('Rei Gosma', 'Sieghart'), ('Gaicoz', 'Mari');
 
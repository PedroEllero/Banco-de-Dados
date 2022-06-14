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

INSERT INTO EQUIPAMENTO(nomeEquipamento, statusEquipamento, nivelRequirido) VALUES ('Cerberus', 'Épico', 78), ('Cristal', 'Épico', 55), ('Andarilho', 'Normal', 28), ('Aventura', 'Normal', 1), ('Berkas', 'Lendário', 85), ('Petrushka', 'Lendário', 80), ('Guardião Eterno', 'Mítico', 1), ('Selvagem', 'Raro', 54), ('Destruição', 'Épico', 63), ('Ellia', 'Mítico', 1);
INSERT INTO CAIXA(idCaixa, raridade, quantidadeItens, nomeEquipamento) VALUES (1, 'normal', 5, 'Aventura'), (2, 'raro', 2, 'Selvagem'), (3, 'épico', 7, 'Cristal'), (4, 'épico', 8, 'Cerberus'), (5, 'Lendário', 15, 'Berkas'), (6, 'Lendário', 15, 'Petrushka'), (7, 'Épico', 3, 'Destruição'), (8, 'Mítico', 14, 'Guardião Eterno'), (9, 'Mítico', 7, 'Ellia'), (10, 'normal', 6, 'Andarilho');
INSERT INTO MONSTRO(nomeMonstro, nivel, raca, idCaixa) VALUES ('Rainha Harpia', 10, 'Ave', 1), ('Gaia', 66, 'Planta', 2), ('Lenacien', 54, 'Besta', 3), ('Odin', 75, 'Deus Nórdico', 4), ('Dragão Rei', 85, 'Dragão', 5), ('Rei dos Anões', 75, 'Anão', 6), ('Periett', 66, 'Lorde da Destruição', 7), ('Duel', 85, 'Vingador', 8), ('Rei Gosma', 10, 'Slime', 9), ('Gaicoz', 24, 'Samurai', 10);
INSERT INTO MASCOTE(nomeMascote, raca, nivelRequirido) VALUES ('Slime Verde', 'Slime', 1), ('Thanatos', 'Deus', 85), ('Flubell', 'Coelho', 10), ('Mary Jane', 'Empregada', 30), ('Bilbo', 'Hobbit', 80), ('Batman', 'Morcego', 42), ('Sapo Medonho', 'Réptil', 20), ('Rei dos Vassalos', 'Humano', 60), ('Hidra', 'Dragão', 75), ('Sphinx', 'Gato', 12);
INSERT INTO INVENTARIO(idInventario, capacidadeMaxima, quantidadeItens, nomeMascote, nomeEquipamento) VALUES (1, 100, 85, 'Slime Verde', 'Cerberus'), (2, 350, 268, 'Thanatos', 'Cristal'), (3, 20, 10, 'Flubell', 'Aventura'), (4, 1820, 1267, 'Mary Jane', 'Selvagem'), (5, 1360, 892, 'Bilbo', 'Petrushka'), (6, 10325, 4625, 'Batman', 'Berkas'), (7, 370, 205, 'Sapo Medonho', 'Guardião Eterno'),(8, 102, 100, 'Rei dos Vassalos', 'Andarilho'), (9, 8503, 7416, 'Hidra', 'Destruição'),(10, 3465, 3005, 'Sphinx', 'Ellia');
INSERT INTO PERSONAGEM(nomePersonagem, idPersonagem, nivel, idInventario, nomeMascote, nomeEquipamento) VALUES ('Elesis', 1, 20, 1, 'Slime Verde', 'Cerberus'), ('Lire', 2, 44, 9, 'Hidra', 'Destruição'), ('Arme', 3, 60, 5, 'Bilbo', 'Petrushka'), ('Lass', 4, 85, 6, 'Batman', 'Berkas'), ('Ryan', 5, 72, 4, 'Mary Jane', 'Selvagem'), ('Ronan', 6, 12, 7, 'Sapo Medonho', 'Guardião Eterno'), ('Jin', 7, 30, 2, 'Thanatos', 'Cristal'),('Amy', 8, 28, 3, 'Flubell', 'Aventura'), ('Sieghart', 9, 85, 8, 'Rei dos Vassalos', 'Andarilho'), ('Mari', 10, 78, 10, 'Sphinx', 'Ellia');
INSERT INTO MUNDO(nomeMundo, idMundo, tipoMundo, nomeMonstro, nomePersonagem) VALUES ('TestWorld', 1, 'test', 'Gaia', 'Lass'), ('WestLuterra', 2, 'Novato', 'Rainha Harpia', 'Elesis'), ('Revelry Row', 3, 'Musical', 'Lenacien', 'Sieghart'), ('Woeful Drylands', 4, 'Desertico', 'Periett', 'Ronan'), ('Scarred Crimson Land', 5, 'Vulcanico', 'Duel', 'Jin'), ('Red Sand Desert', 6, 'DesertoVermelho', 'Odin', 'Amy'), ('Tooki Island', 7, 'BonusWorld', 'Dragão Rei', 'Mari'), ('Snowpang Island', 8, 'Nevado', 'Gaicoz', 'Ryan'), ('Mercia', 9, 'MundoDeCaça', 'Rei Gosma', 'Lire'), ('Walpurgis', 10, 'MundoFantasma', 'Rei dos Anões', 'Arme');
INSERT INTO ARMADURA(nomeEquipamento, descricao, tipo, slot) VALUES ('Cerberus', 'Armadura para peito', 'Épico', 3), ('Cristal', 'Arma de punho', 'Épico', 6), ('Andarilho', 'Capacete', 'Normal', 0), ('Aventura', 'Luvas', 'Normal', 0), ('Berkas', 'Armadura de conjunto', 'Lendário', 8), ('Petrushka', 'Botas', 'Lendário', 5), ('Destruição', 'Capa', 'Épico', 2), ('Guardião Eterno', 'Arma de conjunto', 'Mítico', 6), ('Ellia', 'Calça', 'Mítico', 4);
INSERT INTO ACESSORIO(nomeEquipamento, descricao, slot, habilidade) VALUES ('Cerberus', 'Diadema', 6, 'Queima inimigos'), ('Cristal', 'Escudos', 4, 'Cortes profundos'), ('Andarilho', 'Asas', 2, 'Voar livremente'), ('Aventura', 'Máscara', 1, 'Sem Efeito'), ('Berkas', 'Anel', 9, 'Transforma em dragão'), ('Petrushka', 'Máscara', 6, 'passe livre'), ('Guardião Eterno', 'Acessorio conjunto', 20, 'Prismas Brilhantes'), ('Selvagem', 'Faca', 0, 'Sem Efeitos'), ('Destruição', 'Faca', 7, 'Estilhaçar inimigos'), ('Ellia', 'Anel', 15, 'Névoa Sombria');
INSERT INTO VISUAL(nomeEquipamento, raridade, descricao, cor) VALUES ('Cerberus', 'Épico', 'Capacete Visual', 'Vermelho'), ('Cristal', 'Épico', 'Escudo Visual', 'Branco'), ('Andarilho', 'Normal', 'Asas Visuais', 'Marrom'), ('Aventura', 'Normal', 'Botas Visuais', 'cinza'), ('Berkas', 'Lendário', 'Armadura Visual', 'Preto'), ('Petrushka', 'Lendário', 'Máscara Visual', 'Branco e Preto'), ('Destruição', 'Épico', 'Capa Visual', 'Laranja'), ('Guardião Eterno', 'Mítico', 'Conjunto Visual', 'Branco e Vermelho'), ('Selvagem', 'Raro', 'Faca Visual', 'Azul'), ('Ellia', 'Mítico', 'Arma Visual', 'Vermelho e Preto');
INSERT INTO DERROTAMONSTRO(nomeMonstro, nomePersonagem) VALUES ('Rainha Harpia', 'Elesis'), ('Gaia', 'Lire'), ('Lenacien', 'Arme'), ('Odin', 'Lass'), ('Dragão Rei', 'Ryan'), ('Rei dos Anões', 'Ronan'), ('Periett', 'Jin'), ('Duel', 'Amy'), ('Rei Gosma', 'Sieghart'), ('Gaicoz', 'Mari');
 
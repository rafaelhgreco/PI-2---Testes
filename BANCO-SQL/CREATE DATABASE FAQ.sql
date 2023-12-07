CREATE DATABASE IF NOT EXISTS FAQ;
USE FAQ;

CREATE TABLE tb_adm (
    adm_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    adm_nome VARCHAR(255) NOT NULL,
    adm_email VARCHAR(100) UNIQUE NOT NULL,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL
);

CREATE TABLE tb_perguntas (
    id_pergunta INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    pergunta TEXT,
    resposta TEXT,
    nome_solicitante VARCHAR(255) NOT NULL,
    email_solicitante VARCHAR(100) NOT NULL,
    situacao VARCHAR(255) NOT NULL,
    data_pergunta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    data_resposta DATETIME,
    adm_id_resposta INT,
    CONSTRAINT fk_tb_adm_adm_id FOREIGN KEY (adm_id_resposta) REFERENCES tb_adm(adm_id),
    status_pergunta ENUM('NR','RES','EXC') DEFAULT 'NR',
    view INT
);

DELIMITER //
CREATE TRIGGER before_update_tb_perguntas
BEFORE UPDATE ON tb_perguntas
FOR EACH ROW
BEGIN
    IF NEW.resposta <> OLD.resposta THEN
        SET NEW.data_resposta = CURRENT_TIMESTAMP();
    END IF;
END;
//
DELIMITER ;



INSERT INTO tb_adm (adm_nome, adm_email, usuario, senha)
VALUES ('Renan', 'renan@example.com', 'renan', '1234'),('Rodrigo', 'rodrigo@example.com', 'rodrigo', '1234'),('Rafael', 'rafael@example.com', 'rafael', '1234'),('Victor', 'victor@example.com', 'victor', '1234');


-- Pergunta 1
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta)
VALUES ('Como faço para realizar a matrícula no curso de DSM?', 'João Silva', 'joao.silva@example.com', 'aluno', 'NR');

-- Pergunta 2
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta)
VALUES ('Poderiam fornecer a grade curricular do curso de GPI?', 'Maria Oliveira', 'maria.oliveira@example.com', 'visitante', 'NR');

-- Pergunta 3
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta)
VALUES ('Quais são os requisitos para participar do vestibular de GE?', 'Carlos Santos', 'carlos.santos@example.com', 'visitante', 'NR');

-- Pergunta 4
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta)
VALUES ('Gostaria de saber mais sobre o Projeto Integrador no curso de GTI.', 'Ana Pereira', 'ana.pereira@example.com', 'aluno', 'NR');

-- Pergunta 5
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta)
VALUES ('Existem oportunidades de estágio para alunos do curso de DSM?', 'Lucas Oliveira', 'lucas.oliveira@example.com', 'exaluno', 'NR');

-- Pergunta 6 (Com resposta)
INSERT INTO tb_perguntas (pergunta, resposta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_resposta, adm_id_resposta)
VALUES ('Qual é o prazo para solicitar o trancamento de disciplinas?', 'O prazo para solicitar o trancamento de disciplinas é até o final da terceira semana de aula.', 'Laura Mendes', 'laura.mendes@example.com', 'aluno', 'RES', CURRENT_TIMESTAMP(), '1');

-- Pergunta 7 (Com resposta)
INSERT INTO tb_perguntas (pergunta, resposta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_resposta, adm_id_resposta)
VALUES ('Como faço para obter meu histórico escolar?', 'Para obter o histórico escolar, você pode solicitar no setor de atendimento ao aluno apresentando seu documento de identificação.', 'Fernando Silva', 'fernando.silva@example.com', 'aluno', 'RES', CURRENT_TIMESTAMP(), '3');

-- Pergunta 8 (Com resposta)
INSERT INTO tb_perguntas (pergunta, resposta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_resposta, adm_id_resposta)
VALUES ('Quais são os documentos necessários para a rematrícula?', 'Os documentos necessários para a rematrícula incluem cópias do RG, CPF, comprovante de residência e boletim atualizado.', 'Juliana Oliveira', 'juliana.oliveira@example.com', 'aluno', 'RES', CURRENT_TIMESTAMP(), '2');

-- Pergunta 9 (Anulada)
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta)
VALUES ('Quais são os horários de atendimento da secretaria acadêmica?', 'Felipe Santos', 'felipe.santos@example.com', 'aluno', 'EXC');

-- Pergunta 10 (Anulada)
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta)
VALUES ('Como faço para participar de projetos de pesquisa na faculdade?', 'Carla Lima', 'carla.lima@example.com', 'aluno', 'EXC');


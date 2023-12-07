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
    view INT DEFAULT 0
);

CREATE TRIGGER update_resposta_tb_perguntas
BEFORE UPDATE ON tb_perguntas FOR EACH ROW
SET NEW.data_resposta = CURRENT_TIMESTAMP();



INSERT INTO tb_adm (adm_nome, adm_email, usuario, senha)
VALUES ('Renan Teixeira', 'renan@example.com', 'renan', '1234'),('Rodrigo Rodrigues', 'rodrigo@example.com', 'rodrigo', '1234'),('Rafael Greco', 'rafael@example.com', 'rafael', '1234'),('Victor Chagas', 'victor@example.com', 'victor', '1234');


-- Pergunta 1
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_pergunta)
VALUES ('Como faço para realizar a matrícula no curso de DSM?', 'João Silva', 'joao.silva@example.com', 'aluno', 'NR', '2023-10-15 08:30:00');

-- Pergunta 2
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_pergunta)
VALUES ('Poderiam fornecer a grade curricular do curso de GPI?', 'Maria Oliveira', 'maria.oliveira@example.com', 'visitante', 'NR', '2023-10-20 14:00:00');

-- Pergunta 3
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_pergunta)
VALUES ('Quais são os requisitos para participar do vestibular de GE?', 'Carlos Santos', 'carlos.santos@example.com', 'visitante', 'NR', '2023-10-25 11:45:00');

-- Pergunta 4
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_pergunta)
VALUES ('Gostaria de saber mais sobre o Projeto Integrador no curso de GTI.', 'Ana Pereira', 'ana.pereira@example.com', 'aluno', 'NR', '2023-11-05 16:00:00');

-- Pergunta 5
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_pergunta)
VALUES ('Existem oportunidades de estágio para alunos do curso de DSM?', 'Lucas Oliveira', 'lucas.oliveira@example.com', 'exaluno', 'NR', '2023-11-12 09:30:00');

-- Pergunta 6 (Com resposta)
INSERT INTO tb_perguntas (pergunta, resposta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_pergunta, data_resposta, adm_id_resposta)
VALUES ('Qual é o prazo para solicitar o trancamento de disciplinas?', 'O prazo para solicitar o trancamento de disciplinas é até o final da terceira semana de aula.', 'Laura Mendes', 'laura.mendes@example.com', 'aluno', 'RES', '2023-11-20 11:30:00', '2023-11-22 12:15:00', '4');

-- Pergunta 7 (Com resposta)
INSERT INTO tb_perguntas (pergunta, resposta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_pergunta, data_resposta, adm_id_resposta)
VALUES ('Como faço para obter meu histórico escolar?', 'Para obter o histórico escolar, você pode solicitar no setor de atendimento ao aluno apresentando seu documento de identificação.', 'Fernando Silva', 'fernando.silva@example.com', 'aluno', 'RES', '2023-11-28 15:00:00', '2023-11-30 16:30:00', '3');

-- Pergunta 8 (Com resposta)
INSERT INTO tb_perguntas (pergunta, resposta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_pergunta, data_resposta, adm_id_resposta)
VALUES ('Quais são os documentos necessários para a rematrícula?', 'Os documentos necessários para a rematrícula incluem cópias do RG, CPF, comprovante de residência e boletim atualizado.', 'Juliana Oliveira', 'juliana.oliveira@example.com', 'aluno', 'RES', '2023-12-05 08:00:00', '2023-12-07 09:45:00', '2');

-- Pergunta 9 (Anulada)
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_pergunta)
VALUES ('Quais são os horários de atendimento da secretaria acadêmica?', 'Felipe Santos', 'felipe.santos@example.com', 'aluno', 'EXC', '2023-12-01 13:45:00');

-- Pergunta 10 (Anulada)
INSERT INTO tb_perguntas (pergunta, nome_solicitante, email_solicitante, situacao, status_pergunta, data_pergunta)
VALUES ('Como faço para participar de projetos de pesquisa na faculdade?', 'Carla Lima', 'carla.lima@example.com', 'aluno', 'EXC', '2023-12-05 14:20:00');



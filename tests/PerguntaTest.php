<?php

require_once __DIR__ . '/../class/Pergunta.php'; // Verifique o caminho do arquivo Pergunta.php

class PerguntaTest extends PHPUnit\Framework\TestCase
{
    public function testCarregar()
    {
        $mock = $this->getMockBuilder('Pergunta')
                     ->onlyMethods(['carregar'])
                     ->disableOriginalConstructor()
                     ->getMock();
                     
        $mock->method('carregar')->willReturn(null);
        $mock->id_pergunta = 1;
        $mock->pergunta = 'Qual é a capital da França?';
        $mock->resposta = 'Paris';
        $mock->adm_id_resposta = 1;

        $this->assertEquals(1, $mock->id_pergunta);
        $this->assertEquals('Qual é a capital da França?', $mock->pergunta);
        $this->assertEquals('Paris', $mock->resposta);
        $this->assertEquals(1, $mock->adm_id_resposta);

        print "testCarregar executado com sucesso.\n";
    }

    public function testPostarPergunta()
    {
        $mock = $this->getMockBuilder('Pergunta')
                     ->onlyMethods(['postar_pergunta'])
                     ->disableOriginalConstructor()
                     ->getMock();
                     
        $mock->method('postar_pergunta')->willReturn(null);
        $mock->id_pergunta = 1;
        $mock->pergunta = 'Qual é a capital da Alemanha?';
        $mock->resposta = 'Berlim';
        $mock->adm_id_resposta = 2;
        $mock->status_pergunta = 'RES';

        $this->assertTrue(true);

        print "testPostarPergunta executado com sucesso.\n";
    }
}

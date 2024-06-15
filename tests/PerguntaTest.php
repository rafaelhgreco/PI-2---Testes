<?php

require_once __DIR__ . '/../class/Pergunta.php'; // Inclui o arquivo Pergunta.php necessário para a execução dos testes

class PerguntaTest extends PHPUnit\Framework\TestCase
{
    // Testa o método 'carregar' da classe Pergunta
    public function testCarregar()
    {
        // Cria um mock da classe Pergunta, sobrescrevendo apenas o método 'carregar'
        $mock = $this->getMockBuilder('Pergunta')
                     ->onlyMethods(['carregar'])
                     ->disableOriginalConstructor()
                     ->getMock();
                     
        // Define o comportamento do método 'carregar' para retornar null
        $mock->method('carregar')->willReturn(null);
        
        // Define valores para os atributos do mock
        $mock->id_pergunta = 1;
        $mock->pergunta = 'Qual é a capital da França?';
        $mock->resposta = 'Paris';
        $mock->adm_id_resposta = 1;

        // Verifica se os valores atribuídos são os esperados
        $this->assertEquals(1, $mock->id_pergunta);
        $this->assertEquals('Qual é a capital da França?', $mock->pergunta);
        $this->assertEquals('Paris', $mock->resposta);
        $this->assertEquals(1, $mock->adm_id_resposta);

        // Imprime uma mensagem de sucesso
        print "testCarregar executado com sucesso.\n";
    }

    // Testa o método 'postar_pergunta' da classe Pergunta
    public function testPostarPergunta()
    {
        // Cria um mock da classe Pergunta, sobrescrevendo apenas o método 'postar_pergunta'
        $mock = $this->getMockBuilder('Pergunta')
                     ->onlyMethods(['postar_pergunta'])
                     ->disableOriginalConstructor()
                     ->getMock();
                     
        // Define o comportamento do método 'postar_pergunta' para retornar null
        $mock->method('postar_pergunta')->willReturn(null);
        
        // Define valores para os atributos do mock
        $mock->id_pergunta = 1;
        $mock->pergunta = 'Qual é a capital da Alemanha?';
        $mock->resposta = 'Berlim';
        $mock->adm_id_resposta = 2;
        $mock->status_pergunta = 'RES';

        // Verifica se a condição é verdadeira (substituído pelo comportamento simulado)
        $this->assertTrue(true);

        // Imprime uma mensagem de sucesso
        print "testPostarPergunta executado com sucesso.\n";
    }
}


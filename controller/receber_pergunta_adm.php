<?php 
require_once "../class/pergunta.php";

$pergunta_recebida = new pergunta();
$pergunta_recebida -> pergunta = $_POST['pergunta'];
$pergunta_recebida -> resposta = $_POST['resposta'];
$pergunta_recebida -> nome_adm = $_POST['nomeadm'];
$pergunta_recebida -> adm_email = $_POST['adm_email'];
$pergunta_recebida -> adm_id_resposta = $_POST['seladm'];


$pergunta_recebida->receber_pergunta_adm();
header('Location: ../view/listar_pergunta_sugerida.php');


?>
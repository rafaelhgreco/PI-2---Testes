<?php

session_start();

$usuario = $_POST['usuario'];
$senha = $_POST['senha'];

include "../conexao.php";

$sql = "SELECT * FROM tb_adm WHERE usuario = '{$usuario}' AND senha = '{$senha}'";
$resultado = $conexao->query($sql);
$linha = $resultado->fetch();
$usuario_logado = $linha['usuario'];

if($usuario_logado == null){
    header('Location: ../user/usuario-erro.php');
}
else{
    $_SESSION['usuario_logado'] = $usuario_logado;
    $_SESSION['nome_adm_logado'] = $linha['adm_nome'];
    $_SESSION['adm_id_logado'] = $linha['adm_id'];
    $_SESSION['adm_email'] = $linha['adm_email'];
    header('Location: ../view/listar_pergunta_sugerida.php');
}

$resultado->close();
$conexao->close();

?>
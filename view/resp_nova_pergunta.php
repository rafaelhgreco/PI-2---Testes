<?php 
session_start();

if (isset($_SESSION['nome_adm_logado'])) {
    $nome_adm = $_SESSION['nome_adm_logado'];
} else {
    header('Location: ../login.html');
    exit();
    echo "Sessão não iniciada.";
}

if (isset($_GET['logout'])) {
   
    session_destroy();

    header("Location: ../index.php");
    exit();
}

require_once '../class/pergunta.php';
require_once '../class/admin.php';




$id_pergunta = $_GET['id_pergunta'];
$nova_pergunta = new pergunta($id_pergunta);

?>



<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="../css/areaadmin.css" rel="stylesheet">
    <title>Dashbord Admin</title>
</head>
<body> 
<header>
        <nav class="navbar navbar-expand-lg fixed-top" >
            <img class="logo" src="../img/FATEC.svg">
            
                <div class="container ">
                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
            </button>

                <h2 class="nav-link text-light text-dark">Painel Administrativo</h2> 

                
                <div class="box-search"> 
                    <input type="search" class="form-control w=25" id="pesquisar" placeholder="Pesquisar....">
                    <button class="btn" onclick="searchData()" style="margin-left:5px;"> 
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                    </button>
                </div> 


                <div class="collapse navbar-collapse  " id="navbarNav">

                <ul class="navbar-nav">

                        <li class="nav-item mx-3" >
                            <a class="nav-link text-dark" href="listar_pergunta_sugerida.php">Perguntas sugeridas</a>
                        </li>
                        
                        <li class="nav-item mx-3">
                            <a class="nav-link text-dark" href="form_nova_pergunta.php">Publicar pergunta</a>
                        </li>

                        <li class="nav-item mx-3">
                            <a class="nav-link text-dark" href="listar_pergunta_publicada.php">Perguntas publicadas</a>
                        </li>

                        <li class="nav-item mx-3">
                            <a class="nav-link text-dark" href="listar_pergunta_anulada.php">Perguntas anuladas</a>
                        </li>   

                        </li class="nav-item mx-3">
                            <a class="nav-link text-dark" href="listar_adm.php">Informaçoes de administradores</a>
                        </li>

                        <li class="nav-item mx-3">
                            <a class="nav-link text-dark" href="?logout=true"> Logout</a>
                        </li>
                       
                    </ul>
                    </div>
            </div>    
        </nav>  
    </header>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <br><br><br>
    <?php echo "<p>Seja bem vindo: $nome_adm</p>" ?>
    <main>
        
        <div class="container mt-4">
            <br>
            <form action="../controller/postar_pergunta.php" method="POST">
                <h4 style="text-align: center;">Responder a uma nova pergunta</h4><br><br>
                
                <div class="mb-3">

                    <input type="hidden" name="id_pergunta" value="<?=$nova_pergunta->id_pergunta?>">

                    <label for="pergunta" class="form-label">Pergunta Sugerida:</label>
                    <textarea id="pergunta" name="pergunta" class="form-control" rows="4"><?= $nova_pergunta->pergunta ?></textarea>

                </div>

                <span>Administrador:</span>
                <input type="text" class="form-control" name="nomeadm" value="<?= $nome_adm?>" readonly>
                <input type="hidden" name="seladm" value="<?= $id_adm?>">
                <br><br>

                <div class="mb-3">
                    <label for="resposta" class="form-label">Resposta da Pergunta</label>
                    <textarea class="form-control" id="resposta" name="resposta" rows="4" placeholder="Digite a resposta da pergunta"></textarea>
                </div>

                <div class="d-grid gap-2 d-flex text-center">
                    <button type="submit" class="btn btn-primary ">Adicionar</button>
                    <button type="reset" class="btn btn-secondary">Limpar</button>
                    
                </div>

            </form>
            <br><br>
        </div>
    </main>
   
</body>
</html>
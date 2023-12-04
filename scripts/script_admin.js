var search = document.getElementById('pesquisar');

function searchData()
{
    window.location = 'listar_adm.php?search='+search.value;
}
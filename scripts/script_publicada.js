var search = document.getElementById('pesquisar');
function searchData()
{
    window.location = 'listar_pergunta_publicada.php?search='+search.value;
}

function handleKeyPress(event) {
    if (event.key === 'Enter') {
        searchData();
    }
}
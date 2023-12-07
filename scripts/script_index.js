

document.addEventListener('DOMContentLoaded', function () {
    var accordionHeaders = document.querySelectorAll('.accordion-header');

    accordionHeaders.forEach(function (header) {
        header.addEventListener('click', function () {
            var accordionItem = this.parentNode;
            accordionItem.classList.toggle('active');

            var content = accordionItem.querySelector('.accordion-collapse');
            if (content.style.maxHeight) {
                content.style.maxHeight = null;
            } else {
                content.style.maxHeight = content.scrollHeight + 'px';
            }
        });
    });


    accordionHeaders.forEach(function (header) {
        var accordionItem = header.parentNode;
        accordionItem.classList.remove('active');
        var content = accordionItem.querySelector('.accordion-collapse');
        content.style.maxHeight = null;
    });
});

var search = document.getElementById('pesquisar');
function searchData()
{
    window.location = 'index.php?search='+search.value;
}

function handleKeyPress(event) {
    if (event.key === 'Enter') {
        searchData();
    }
}

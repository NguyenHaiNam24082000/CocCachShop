$(document).ready(function () {
    let id=""
    $("tbody").on('click', 'tr', function () {
        id = $(this).find('td').eq(0).text();
        
    })
    
})
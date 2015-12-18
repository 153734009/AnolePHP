;$(function(){
    $("#datatables-recipients").DataTable({
        ordering: false,
        lengthMenu: [100]
    });

    $("#datatables-report-logs").DataTable({
        ordering: false,
        lengthMenu: [100],
        buttons: [ 'excel', 'pdf' ],
    });
})


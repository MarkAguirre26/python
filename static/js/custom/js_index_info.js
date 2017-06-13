$(document).ready(function(){

    $(function () {
        $.ajax({
            type: "GET",
            url: "fetchData",
            dataType: "json",
            success: function(data){
                $('#listtable').DataTable({
                    "bProcessing": true,
                    "deferRender": true,
                    data: data,
                    columns:[
                        {title:"#"},
                        {title: "Name"},
                        {title:"Color"}
                    ]

                });


            },
            error:function (xhr, ajaxOptions, thrownError){
                alert(thrownError);
            }

        });
    });
    $(function() {
        $('#cmd_save').bind('click', function () {
            $.getJSON('/insert', $("#_form").serialize(), function (data) {
                if(data.status.msg =="true"){
                    alert("Saved");
                }else {
                    alert("Failed");
                }


            });
            return false;
        });
    });

    $(function() {

        $('.aaf').on("click",function(){
              var id =  $(this).data("id");
            $.getJSON('/fetchCars/'+id,  function (data) {

                console.log(data);
                $('#listtable').DataTable({
                    "bProcessing": true,
                    "deferRender": true,
                    data: data,
                    columns:[
                        {title:"#"},
                        {title: "Name"},
                        {title:"Color"}
                    ]

                });

window.location.reload(true);
            });
            return false;
        });
    });


});/**
 * Created by Asus on 6/2/2017.
 */






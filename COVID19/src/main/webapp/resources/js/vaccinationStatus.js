getVaccineStatusData();

function getVaccineStatusData(){
    console.log("fuct실행");
    $.ajax({
        url:"VaccineStatusApiCall.do",
        success:function(resultData){
            console.log(resultData);
        }
    })
}
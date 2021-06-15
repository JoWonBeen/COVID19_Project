let i =1;
$.ajax({
    url:"VaccCenterApiCall.do",
    success:function(resultData){
        console.log(resultData);
        console.log(resultData.data[0]);
    }
});
$.ajax({
    url:"ConsignedInstApiCall.do",
    success:function(resultData){
        console.log(resultData);
        console.log(Number(resultData.data[0].slrYmd)-1);
    }
});
